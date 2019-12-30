import 'package:hive/hive.dart';
import 'package:school_life/models/subject.dart';
import 'package:school_life/services/databases/subjects_db.dart';

class SubjectsRepository {
  Box _subjectsDB;
  int get newID => getAllSubjects().length;

  SubjectsRepository() {
    _subjectsDB = Hive.box(SubjectsDBCreator.SUBJECTS_BOX);
  }

  List<Subject> getAllSubjects() {
    final List<Subject> data = _subjectsDB.values.toList();
    return data ?? [];
  }

  Map<int, Subject> getSubjectsMap() {
    final List<Subject> allSubjects = getAllSubjects();
    Map<int, Subject> subjectsByID = {};
    for (Subject subject in allSubjects) {
      subjectsByID[subject.id] = subject;
    }
    return subjectsByID;
  }

  Subject getSubject(int id) {
    return _subjectsDB.getAt(id);
  }

  void addSubject(Subject subject) {
    _subjectsDB.add(subject);
  }

  void deleteSubject(Subject subject) {
    _subjectsDB.delete(subject.id);
  }

  Future<void> updateSubject(Subject subject) async {
    _subjectsDB.put(subject.id, subject);
  }
}

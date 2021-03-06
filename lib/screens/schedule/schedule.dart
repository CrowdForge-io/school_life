import 'package:flutter/material.dart';
import 'package:school_life/components/dialog/dialogs.dart';
import 'package:school_life/components/index.dart';
import 'package:school_life/main.dart';
import 'package:school_life/models/subject.dart';
import 'package:school_life/routing/router.gr.dart';
import 'package:school_life/screens/schedule/add_schedule/add_schedule.dart';
import 'package:school_life/screens/settings/pages/index.dart';
import 'package:school_life/services/databases/subjects_repository.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _userHasSubjects = false;

  @override
  void initState() {
    super.initState();
    _doesUserHaveSubjects();
  }

  void _doesUserHaveSubjects() {
    final List<Subject> subjects = getIt<SubjectsRepository>().getAllSubjects();
    if (subjects.isNotEmpty) {
      _userHasSubjects = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'Schedule',
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Router.navigator.push(
              MaterialPageRoute<ScheduleSettingsPage>(
                builder: (BuildContext context) => ScheduleSettingsPage(),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleAddScheduleButtonPress,
        label: const Text('ADD SUBJECT SCHEDULE'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _handleAddScheduleButtonPress() {
    if (!_userHasSubjects) {
      showNoSubjectsDialog(context);
      return;
    }
    Router.navigator.push(
      MaterialPageRoute<AddSchedulePage>(
        builder: (BuildContext context) => AddSchedulePage(),
        fullscreenDialog: true,
      ),
    );
  }
}

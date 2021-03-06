import 'package:flutter/material.dart';
import 'package:school_life/routing/router.gr.dart';

class ChooseDaysOfSchoolDialog extends StatefulWidget {
  const ChooseDaysOfSchoolDialog({
    Key key,
    @required this.selectedDays,
    @required this.onSaved,
  }) : super(key: key);

  final Map<String, bool> selectedDays;
  final ValueChanged<Map<String, bool>> onSaved;

  @override
  _ChooseDaysOfSchoolDialogState createState() =>
      _ChooseDaysOfSchoolDialogState(selectedDays);
}

class _ChooseDaysOfSchoolDialogState extends State<ChooseDaysOfSchoolDialog> {
  _ChooseDaysOfSchoolDialogState(this._selectedDays);

  final Map<String, bool> _selectedDays;

  @override
  Widget build(BuildContext context) {
    final DialogTheme _dialogTheme = Theme.of(context).dialogTheme;
    final Color _contentStyleColor = _dialogTheme.contentTextStyle.color;
    return AlertDialog(
      title: const Text('What days do you have school?'),
      actions: <Widget>[
        MaterialButton(
          child: Text(
            'SAVE',
            style: TextStyle(color: _contentStyleColor),
          ),
          onPressed: () {
            widget.onSaved(_selectedDays);
            Router.navigator.pop();
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: const Text('Monday'),
              value: _selectedDays['1'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['1'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Tuesday'),
              value: _selectedDays['2'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['2'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Wednesday'),
              value: _selectedDays['3'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['3'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Thursday'),
              value: _selectedDays['4'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['4'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Friday'),
              value: _selectedDays['5'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['5'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Saturday'),
              value: _selectedDays['6'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['6'] = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Sunday'),
              value: _selectedDays['7'],
              onChanged: (bool value) {
                setState(() {
                  _selectedDays['7'] = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

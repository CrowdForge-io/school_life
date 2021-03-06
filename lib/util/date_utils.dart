import 'package:flutter/material.dart';

extension DateUtils on DateTime {
  DateTime get todaysDate => DateTime(year, month, day);
  TimeOfDay get currentTime => TimeOfDay.fromDateTime(this);

  DateTime addYears(int years) {
    return add(Duration(days: 365 * years));
  }
}

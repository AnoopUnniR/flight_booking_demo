import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';


//date time picker widget for picking the date of travel
Widget daypicker(
    {required selectedDate,
    required Function(DateTime) onChanged,
    required firstDate,
    required lastDate}) {
      //style decoration for the date time picker widget
  DatePickerRangeStyles styles = DatePickerRangeStyles(
    selectedPeriodLastDecoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10.0), bottomEnd: Radius.circular(10.0))),
    selectedPeriodStartDecoration: const BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.0), bottomStart: Radius.circular(10.0)),
    ),
    selectedPeriodMiddleDecoration:
        const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle),
  );
  return DayPicker.single(
      selectedDate: selectedDate,
      onChanged: onChanged,
      firstDate: firstDate,
      lastDate: lastDate,
      datePickerStyles: styles);
}

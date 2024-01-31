import 'package:flight_booking/presentation/home_screen/widget/custom_date_picker/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerWWidget extends StatelessWidget {
  CustomDatePickerWWidget({
    super.key,
    required this.width,
    required this.dateController
  });

  final double width;
  final ValueNotifier<DateTime> dateNotifier = ValueNotifier(DateTime.now());
  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 45,
      //updates the text field showing date to selected date
      child: ValueListenableBuilder(
          valueListenable: dateNotifier,
          builder: (context, value, _) {
            return InkWell(
              onTap: () {
                //date picker widget
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      //updates the date picker widget
                      content: ValueListenableBuilder(
                        valueListenable: dateNotifier,
                        builder: (context, value, child) => daypicker(
                          selectedDate: dateNotifier.value,
                          onChanged: (selectedDate) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
                            //setting value to the text field
                            dateController.text = formattedDate;
                            //setting value to value notifier to update ui
                            dateNotifier.value = selectedDate;
                          },
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Select"),
                        )
                      ],
                    );
                  },
                );
              },
              child: TextField(
                enabled: false,
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: "Date",
                  labelStyle: TextStyle(color: Colors.black87),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

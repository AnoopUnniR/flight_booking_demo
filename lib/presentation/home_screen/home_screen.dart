import 'package:flight_booking/core/constants/constant_widgets.dart';
import 'package:flight_booking/presentation/home_screen/widget/flight_direction_choice.dart';
import 'package:flutter/material.dart';

import 'widget/custom_date_picker/custom_date_picker_w_widget.dart';
import 'widget/custom_home_screen_text_field.dart';
import 'widget/seach_flights_button_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ValueNotifier<FlightTripDirections> selectedWay =
      ValueNotifier<FlightTripDirections>(FlightTripDirections.oneWay);
  final TextEditingController fromPlaceController = TextEditingController();
  final TextEditingController toPlaceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("Flight Booking"),
        actions: const [Icon(Icons.add_alert_rounded), sbw10],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                sbh20,
                FlightDirectionChipWidget(selectedWay: selectedWay),
                sbh20,
                Column(
                  children: [
                    CustomHomeScreenTextField(
                      labelText: "From",
                      controller: fromPlaceController,
                    ),
                    sbh20,
                    CustomHomeScreenTextField(
                      labelText: "To",
                      controller: toPlaceController,
                    ),
                    sbh20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //date picker widget
                        CustomDatePickerWWidget(
                          width: width,
                          dateController: dateController,
                        ),
                        SizedBox(
                          width: width * 45,
                          child: const CustomHomeScreenTextField(
                            labelText: "Passengers",
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    sbh20,
                    //promo text field
                    ColoredBox(
                      color: Colors.grey.shade400,
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16.0),
                          hintText: 'Enter Promo',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    sbh30,
                    SizedBox(
                      width: width * 80,
                      height: 50,
                      child: SeachFlightsButtonWidget(
                        fromPlaceController: fromPlaceController,
                        toPlaceController: toPlaceController,
                        dateController: dateController,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

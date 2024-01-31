import 'package:flight_booking/core/dummy_json.dart';
import 'package:flight_booking/models/flight_model.dart';
import 'package:flight_booking/presentation/search_result_page/search_results_page.dart';
import 'package:flutter/material.dart';

class SeachFlightsButtonWidget extends StatelessWidget {
  const SeachFlightsButtonWidget(
      {super.key,
      required this.fromPlaceController,
      required this.toPlaceController,
      required this.dateController});
  final TextEditingController fromPlaceController;
  final TextEditingController toPlaceController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //checking if values are empty
        if (fromPlaceController.text.trim().isEmpty ||
            toPlaceController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please fill in the from and to location"),
            ),
          );
        } else if (dateController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please select a date"),
            ),
          );
        } else {
          FlightList flightDetails =  FlightList.fromJson(jsondata);
          List<Flight> flightData = [...flightDetails.flight];
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchResultsPage(
                fromPlace: fromPlaceController.text,
                toPlace: toPlaceController.text,
                date: dateController.text.trim(),
                flightDetails: flightData,
              ),
            ),
          );
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.blue.shade900),
      ),
      child: const Text(
        "Search Flight",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

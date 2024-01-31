import 'package:flight_booking/models/flight_model.dart';
import 'package:flutter/material.dart';

import 'widgets/flight_tile_widget.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage(
      {super.key,
      required this.flightDetails,
      required this.fromPlace,
      required this.toPlace,
      required this.date});
  final String fromPlace;
  final String toPlace;
  final String date;
  final List<Flight> flightDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColoredBox(
            color: Colors.blue,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${fromPlace.toUpperCase()} to ${toPlace.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          //List of available flights from the search
          Expanded(
            child: ListView.builder(
              itemCount: flightDetails.length,
              itemBuilder: (context, index) {
                Flight flightModel = flightDetails[index];
                return FlightTileWidget(
                  flightModel: flightModel,
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

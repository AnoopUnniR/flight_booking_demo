import 'package:flight_booking/core/constants/constant_widgets.dart';
import 'package:flight_booking/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'show_flight_details_dialog.dart';

class FlightTileWidget extends StatelessWidget {
  const FlightTileWidget({
    super.key,
    required this.flightModel,
  });
  final Flight flightModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(flightModel.airline),
              Row(
                children: [
                  customTextTime("8:55"),
                  sbw10,
                  customTravelTime("1h 50m"),
                  sbw10,
                  customTextTime("10:45"),
                ],
              ),
            ],
          ),
          trailing: Text(
            "\$${flightModel.price}",
            style:const TextStyle(fontSize: 15),
          ),
          subtitle: customTravelTime("Connecting 6E 6212 6E"),
          onTap: () {
            showFlightDetailsDialog(context,flightModel);
          },
        ),
      ),
    );
  }

  Text customTravelTime(String time) {
    return Text(
      "-- $time --",
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    );
  }

  Text customTextTime(String time) {
    return Text(
      time,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
    );
  }
}

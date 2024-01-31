import 'package:flight_booking/core/apikey.dart';
import 'package:flight_booking/core/constants/constant_widgets.dart';
import 'package:flight_booking/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Future<void> showFlightDetailsDialog(BuildContext context,Flight flight) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Flight Details'),
        content:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flight Number: ${flight.flightName}'),
            sbh10,
            Text('Departure: ${flight.departureCity}'),
            sbh10,
            Text('Destination: ${flight.destinationCity}'),
            sbh10,
            Text('Departure Time: ${flight.departureTime}'),
            sbh10,
            const Text('Arrival Time: 02:00 PM'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // integrating the payment gateway as fake for testing purpose
              // only
              final razorPay = Razorpay();
              var options = {
                'key': razorApiKey,
                'amount': flight.price * 100,
                'name': 'Flight Booking ',
                'description': 'Book your flight',
                'retry': {'enabled': true, 'max_count': 1},
                'send_sms_hash': true,
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                },
                'external': {
                  'wallets': ['paytm']
                }
              };
              razorPay.open(options);
              //------------------------------------------------------------------
            },
            child: const Text('Book Now'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

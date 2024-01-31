import 'package:flutter/material.dart';

class FlightDirectionChipWidget extends StatelessWidget {
  const FlightDirectionChipWidget({
    super.key,
    required this.selectedWay,
  });
  final ValueNotifier<FlightTripDirections> selectedWay;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedWay,
      builder: (context, selectedValue, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChoiceChip(
              label: const Text("One-Way"),
              selected: selectedValue == FlightTripDirections.oneWay,
              onSelected: (value) {
                selectedWay.value = FlightTripDirections.oneWay;
              },
            ),
            ChoiceChip(
              label: const Text("Two-Way"),
              selected: selectedValue == FlightTripDirections.twoWay,
              onSelected: (value) {
                selectedWay.value = FlightTripDirections.twoWay;
              },
            ),
            ChoiceChip(
              label: const Text("Multi City"),
              selected: selectedWay.value == FlightTripDirections.multiCity,
              onSelected: (value) {
                selectedWay.value = FlightTripDirections.multiCity;
              },
            ),
          ],
        );
      },
    );
  }
}


enum FlightTripDirections { oneWay, twoWay, multiCity }

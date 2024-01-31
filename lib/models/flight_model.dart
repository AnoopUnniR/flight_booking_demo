class Flight {
  String flightName;
  String airline;
  String departureCity;
  String destinationCity;
  String departureTime;
  String arrivalTime;
  double price;

  Flight({
    required this.flightName,
    required this.airline,
    required this.departureCity,
    required this.destinationCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      flightName: json['flightName'],
      airline: json['airline'],
      departureCity: json['departureCity'],
      destinationCity: json['destinationCity'],
      departureTime: json['departureTime'],
      arrivalTime: json['arrivalTime'],
      price: json['price'].toDouble(),
    );
  }
}

class FlightList {
  List<Flight> flight;

  FlightList({required this.flight});

  factory FlightList.fromJson(Map<String, dynamic> json) {
    List<dynamic> flightList = json['flight'];
    List<Flight> flights = flightList.map((flight) => Flight.fromJson(flight)).toList();
    return FlightList(flight: flights);
  }
}
class Car {
  String id;
  String make;
  String model;
  String year;
  String color;
  String price;
  bool isBooked;
  //String userId;

  Car._internal({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.price,
    required this.isBooked,
    //required this.userId,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car._internal(
      id: json['id'].toString(),
      make: json['make'],
      model: json['model'],
      year: json['year'].toString(),
      color: json['color'],
      price: json['price'].toString(),
      isBooked: json['isBooked'],
      //userId: json['userId'],
    );
  }
}

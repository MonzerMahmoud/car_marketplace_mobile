import '../../../core/models/car.dart';

class SearchCarResponseModel {
  List<Car> cars;

  SearchCarResponseModel._internal({required this.cars});

  factory SearchCarResponseModel.fromJson(List<dynamic> json) {
    return SearchCarResponseModel._internal(
      cars: json.map((e) => Car.fromJson(e)).toList(),
    );
  }
}

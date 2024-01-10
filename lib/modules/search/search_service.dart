import 'dart:convert';
import 'dart:developer';

import 'package:car_marketplace_mobile/core/base_service.dart';
import 'package:car_marketplace_mobile/core/models/car.dart';
import 'package:car_marketplace_mobile/modules/search/models/filters_response_model.dart';
import 'package:car_marketplace_mobile/modules/search/models/search_cars_response_model.dart';

class SearchService extends BaseService {
  Future<List<String>?> getFilters(String filter) async {
    try {
      var res = await get(
        'car/filters?for=$filter',
      );
      return FiltersResponseModel.fromJson(res.body).values;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Car>> searchCar(Map<String, dynamic> searchParams) async {
    try {
      var res = await get('car/search', query: searchParams);
      List<Car> carList = List<Car>.from(res.body.map((car) => Car.fromJson(car)));
      return carList;
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'dart:developer';

import 'package:car_marketplace_mobile/modules/search/search_service.dart';
import 'package:get/get.dart';

import '../../core/models/car.dart';

class SearchController extends GetxController {
  SearchController(this.searchService);

  final SearchService searchService;

  RxList makers = [].obs;
  RxString selectedMaker = ''.obs;
  RxList models = [].obs;
  RxString selectedModel = ''.obs;
  RxList years = [].obs;
  RxString selectedYear = ''.obs;

  var cars = RxList<Car>();

  @override
  Future<void> onInit() async {
    await getFiltersData();
    await searchCar({});
    super.onInit();
  }

  getFiltersData() async {
    makers.value = await searchService.getFilters('make') ?? [];
    makers.sort();
    //selectedMaker.value = makers.first;
    models.value = await searchService.getFilters('model') ?? [];
    models.sort();
    //selectedModel.value = models.first;
    years.value = await searchService.getFilters('year') ?? [];
    years.sort();
    //selectedYear.value = years.first;
  }

  searchCar(Map<String, dynamic> params) async {
    cars.value = await searchService.searchCar(params);
    update();
    log(cars.toString());
  }
}

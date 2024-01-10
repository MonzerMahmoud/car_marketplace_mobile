import 'package:car_marketplace_mobile/modules/search/search_controller.dart';
import 'package:get/get.dart';

class SearchAction {
  static searchCar(String? make, String? model, String? year) async {
    Map<String, dynamic> params = {};
    params.addIf(make != null && make != '', 'make', make);
    params.addIf(model != null && model != '', 'model', model);
    params.addIf(year != null && year != '', 'year', year);
    await Get.find<SearchController>().searchCar(params);
  }
}

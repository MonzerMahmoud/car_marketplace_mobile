import 'package:car_marketplace_mobile/modules/search/search_controller.dart';
import 'package:car_marketplace_mobile/modules/search/search_service.dart';
import 'package:get/get.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchService());
    Get.lazyPut(
      () => SearchController(
        Get.find<SearchService>(),
      ),
    );
  }
}

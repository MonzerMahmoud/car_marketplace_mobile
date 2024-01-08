import 'package:car_marketplace_mobile/modules/auth/auth_controller.dart';
import 'package:car_marketplace_mobile/modules/auth/auth_service.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(
      () => AuthController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}

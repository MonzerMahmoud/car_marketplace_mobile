import 'package:car_marketplace_mobile/core/routes/app_routes.dart';
import 'package:car_marketplace_mobile/modules/auth/auth_binding.dart';
import 'package:car_marketplace_mobile/modules/auth/auth_page.dart';
import 'package:car_marketplace_mobile/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
  ];
}

import 'package:car_marketplace_mobile/core/initial_bindings.dart';
import 'package:car_marketplace_mobile/core/routes/app_pages.dart';
import 'package:car_marketplace_mobile/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Marketplace",
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: InitialBindings(),
    );
  }
}
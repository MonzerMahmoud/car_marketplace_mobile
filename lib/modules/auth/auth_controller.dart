import 'dart:developer';

import 'package:car_marketplace_mobile/modules/auth/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthPageEnum { login, register }

class AuthController extends GetxController {
  AuthController({required this.authService});
  final AuthService authService;

  var currentPage = AuthPageEnum.login.obs;

  Future<bool> signIn(String username, String password) async {
    try {
      var result = await authService.signIn(username, password);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('Access_Token', result.token!);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String username, String password) async {
    try {
      var result = await authService.signUp(username, password);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('Access_Token', result.token!);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}

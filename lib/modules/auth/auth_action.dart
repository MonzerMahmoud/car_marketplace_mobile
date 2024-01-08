import 'dart:developer';

import 'package:car_marketplace_mobile/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class AuthAction {
  static signInPressed(String username, String password) async {
    if (await Get.find<AuthController>().signIn(username, password)) {
      log('Sign in successful');
      Get.snackbar('Success', 'Sign in successful');
    } else {
      log('Error while signing in');
      Get.snackbar('Error', 'Error while signing in');
    }
  }

  static signUpPressed(String username, String password) async {
    if (await Get.find<AuthController>().signUp(username, password)) {
      log('Sign up successful');
      Get.snackbar('Success', 'Sign up successful');
    } else {
      log('Error while signing up');
      Get.snackbar('Error', 'Error while signing up');
    }
  }
}

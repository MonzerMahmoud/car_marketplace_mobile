import 'package:car_marketplace_mobile/modules/auth/models/auth_response_model.dart';
import 'package:get/get.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://localhost:3000/';
  }

  Future<AuthResponseModel> signIn(String username, String password) async {
    try {
      var res = await post(
          'auth/login', {'username': username, 'password': password});

      if (res.status.isOk) {
        return AuthResponseModel.fromJson(res.body);
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AuthResponseModel> signUp(String username, String password) async {
    try {
      var res = await post(
          'auth/register', {'username': username, 'password': password});
      if (res.status.isOk) {
        return AuthResponseModel.fromJson(res.body);
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

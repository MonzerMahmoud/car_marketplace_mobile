import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService extends GetConnect {
  @override
  Future<void> onInit() async {
    httpClient.baseUrl = 'http://localhost:3000/';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('Access_Token');
    
    var headers = {'Authorization': "Bearer $token"};
    httpClient.addAuthenticator<dynamic>((request) async {
      request.headers.addAll(headers);
      return request;
    });

    super.onInit();
  }
}

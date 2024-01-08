import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const String _kAccessToken = 'Access_Token';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  String get accessToken => _getData(_kAccessToken);
  set setAccessToken(String value) => _saveData(_kAccessToken, value);

  dynamic _getData(String key) {
    var value = _preferences?.get(key);

    log('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    log('Saving $key: $value');

    if (value is String) {
      _preferences?.setString(key, value);
    } else if (value is int) {
      _preferences?.setInt(key, value);
    } else if (value is double) {
      _preferences?.setDouble(key, value);
    } else if (value is bool) {
      _preferences?.setBool(key, value);
    } else if (value is List<String>) {
      _preferences?.setStringList(key, value);
    }
  }
}

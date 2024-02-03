import '../../../core/models/user.dart';

class AuthResponseModel {
  String token;
  User user;

  AuthResponseModel._internal({required this.token, required this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel._internal(
        token: json['access_token'],
        user: User.fromJson(json['user']),
      );
}

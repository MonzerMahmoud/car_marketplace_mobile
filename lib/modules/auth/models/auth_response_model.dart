class AuthResponseModel {
  final String? token;

  AuthResponseModel._internal({this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel._internal(token: json['access_token']);
}

import 'package:car_marketplace_mobile/core/enum/role_enum.dart';

class User {
  String id;
  String name;
  RoleEnum role;

  User._internal({required this.id, required this.name, required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User._internal(
      id: json['id'].toString(),
      name: json['name'],
      role: RoleEnum.values.firstWhere((role) => role.value == json['role']),
    );
  }
}

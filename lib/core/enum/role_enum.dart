enum RoleEnum {
  user,
  superuser,
}

extension RoleEnumExtension on RoleEnum {
  int get value {
    switch (this) {
      case RoleEnum.user:
        return 2;
      case RoleEnum.superuser:
        return 1;
    }
  }
}

import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_role_entity.dart';

class UserRoleModel extends UserRoleEntity {
  UserRoleModel({
    @required String id,
    @required String title,
  }) : super(id: id, title: title);

  factory UserRoleModel.fromJson(String str) =>
      UserRoleModel.fromMap(json.decode(str));

  factory UserRoleModel.fromMap(Map<String, dynamic> json) => UserRoleModel(
        id: json["_id"],
        title: json["role_title"],
      );
}

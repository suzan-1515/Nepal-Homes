import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String id,
    @required String name,
    @required String email,
    @required bool emailVerified,
    @required List<String> roles,
  }) : super(
          id: id,
          name: name,
          emailVerified: emailVerified,
          email: email,
          roles: roles,
        );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerified: json["email_verified"],
        roles: json["roles"] == null
            ? null
            : List<String>.from(json["roles"].map((x) => x)),
      );
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String id,
    @required String email,
    @required String username,
    @required String fullname,
    @required String token,
    @required String avatar,
    @required bool isAnonymous,
    @required bool blocked,
    @required bool confirmed,
    @required bool isNew,
    @required String method,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  }) : super(
          id: id,
          email: email,
          username: username,
          fullname: fullname,
          token: token,
          avatar: avatar,
          isAnonymous: isAnonymous,
          blocked: blocked,
          confirmed: confirmed,
          isNew: isNew,
          method: method,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"].toString(),
        email: json["email"],
        username: json["username"],
        fullname: json["fullname"],
        token: json["jwt"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        avatar: json["avatar"],
        isAnonymous: json["is_anonymous"] ?? false,
        blocked: json["blocked"] ?? false,
        confirmed: json["confirmed"] ?? true,
        isNew: json["is_new"] ?? false,
        method: json["provider"],
      );
}

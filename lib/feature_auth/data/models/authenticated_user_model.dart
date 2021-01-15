import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_auth/data/models/user_model.dart';
import 'package:nepal_homes/feature_auth/domain/entities/auth_provider.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  AuthenticatedUserModel({
    @required bool success,
    @required UserEntity user,
    @required String msg,
    @required String token,
    AuthProvider provider = AuthProvider.EMAIL,
  }) : super(
          success: success,
          user: user,
          msg: msg,
          token: token,
          provider: provider,
        );

  factory AuthenticatedUserModel.fromJson(String str) =>
      AuthenticatedUserModel.fromMap(json.decode(str));

  factory AuthenticatedUserModel.fromMap(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
        success: json["success"],
        user: json["data"] == null ? null : UserModel.fromMap(json["data"]),
        msg: json["msg"],
        token: json["token"],
        provider: json['provider'] == null
            ? AuthProvider.EMAIL
            : (json['provider'] as String).toAuthProvider,
      );
}

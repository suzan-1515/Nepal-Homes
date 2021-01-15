import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';

import 'auth_provider.dart';

class AuthenticatedUserEntity extends Equatable {
  AuthenticatedUserEntity({
    @required this.success,
    @required this.user,
    @required this.msg,
    @required this.token,
    this.provider = AuthProvider.EMAIL,
  });

  final bool success;
  final UserEntity user;
  final String msg;
  final String token;
  final AuthProvider provider;

  AuthenticatedUserEntity copyWith({
    bool success,
    UserEntity user,
    String msg,
    String token,
    AuthProvider provider,
  }) =>
      AuthenticatedUserEntity(
        success: success ?? this.success,
        user: user ?? this.user,
        msg: msg ?? this.msg,
        token: token ?? this.token,
        provider: provider ?? this.provider,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": user?.toMap(),
        "msg": msg,
        "token": token,
        "provider": provider.toString(),
      };

  @override
  List<Object> get props => [success, user, msg, token, provider];
}

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserEntity extends Equatable {
  UserEntity({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.emailVerified,
    @required this.roles,
  });

  final String id;
  final String name;
  final String email;
  final bool emailVerified;
  final List<String> roles;

  UserEntity copyWith({
    String id,
    String name,
    String email,
    bool emailVerified,
    List<String> roles,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerified: emailVerified ?? this.emailVerified,
        roles: roles ?? this.roles,
      );

  factory UserEntity.fromJson(String str) =>
      UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerified: json["email_verified"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified": emailVerified,
        "roles": List<dynamic>.from(roles.map((x) => x)),
      };

  @override
  List<Object> get props => [id, name, emailVerified, email, roles];
}

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserRoleEntity extends Equatable {
  UserRoleEntity({
    @required this.id,
    @required this.title,
  });

  final String id;
  final String title;

  UserRoleEntity copyWith({
    String id,
    String title,
  }) =>
      UserRoleEntity(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory UserRoleEntity.fromJson(String str) =>
      UserRoleEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRoleEntity.fromMap(Map<String, dynamic> json) => UserRoleEntity(
        id: json["_id"],
        title: json["role_title"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "role_title": title,
      };

  @override
  List<Object> get props => [id, title];
}

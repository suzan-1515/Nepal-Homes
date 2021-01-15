import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserSignUpEntity extends Equatable {
  UserSignUpEntity({
    @required this.email,
    @required this.mobileNo,
    @required this.name,
    @required this.password,
  });

  final String email;
  final String mobileNo;
  final String name;
  final String password;

  UserSignUpEntity copyWith({
    String email,
    String mobileNo,
    String name,
    String password,
  }) =>
      UserSignUpEntity(
        email: email ?? this.email,
        mobileNo: mobileNo ?? this.mobileNo,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  factory UserSignUpEntity.fromJson(String str) =>
      UserSignUpEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSignUpEntity.fromMap(Map<String, dynamic> json) =>
      UserSignUpEntity(
        email: json["email"],
        mobileNo: json["mobile_no"],
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "mobile_no": mobileNo,
        "name": name,
        "password": password,
      };

  @override
  List<Object> get props => [email, name, mobileNo, password];
}

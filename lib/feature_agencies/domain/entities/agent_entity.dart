import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/image_entity.dart';

class AgentEntity extends Equatable {
  AgentEntity({
    @required this.name,
    @required this.email,
    @required this.mobileNo,
    @required this.image,
  });

  final String name;
  final String email;
  final String mobileNo;
  final ImageEntity image;

  AgentEntity copyWith({
    String name,
    String email,
    String mobileNo,
    ImageEntity image,
  }) =>
      AgentEntity(
        name: name ?? this.name,
        email: email ?? this.email,
        mobileNo: mobileNo ?? this.mobileNo,
        image: image ?? this.image,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "mobile_no": mobileNo,
        "image": image.toMap(),
      };

  @override
  List<Object> get props => [name, email, mobileNo, image];
}

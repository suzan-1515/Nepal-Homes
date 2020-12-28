import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/data/models/image_model.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/image_entity.dart';

class AgentModel extends AgentEntity {
  AgentModel({
    @required String name,
    @required String email,
    @required String mobileNo,
    @required ImageEntity image,
  }) : super(name: name, email: email, mobileNo: mobileNo, image: image);

  factory AgentModel.fromJson(String str) =>
      AgentModel.fromMap(json.decode(str));

  factory AgentModel.fromMap(Map<String, dynamic> json) => AgentModel(
        name: json["name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        image: (json['image']==null)?null:ImageModel.fromMap(json["image"]),
      );
}

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/ownership_type_entity.dart';

class OwnershipTypeModel extends OwnershipTypeEntity {
  OwnershipTypeModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory OwnershipTypeModel.fromJson(String str) =>
      OwnershipTypeModel.fromMap(json.decode(str));

  factory OwnershipTypeModel.fromMap(Map<String, dynamic> json) =>
      OwnershipTypeModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';

class PropertyTypeModel extends PropertyTypeEntity {
  PropertyTypeModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory PropertyTypeModel.fromJson(String str) =>
      PropertyTypeModel.fromMap(json.decode(str));

  factory PropertyTypeModel.fromMap(Map<String, dynamic> json) =>
      PropertyTypeModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

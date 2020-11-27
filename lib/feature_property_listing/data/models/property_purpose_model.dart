import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/image_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';

class PropertyPurposeModel extends PropertyPurposeEntity {
  PropertyPurposeModel({
    @required String id,
    @required ImageModel media,
    @required String description,
    @required String title,
    @required int order,
  }) : super(
            id: id,
            media: media,
            description: description,
            title: title,
            order: order);

  factory PropertyPurposeModel.fromJson(String str) =>
      PropertyPurposeModel.fromMap(json.decode(str));

  factory PropertyPurposeModel.fromMap(Map<String, dynamic> json) =>
      PropertyPurposeModel(
        id: json["_id"],
        media: json["media"] == null ? null : ImageModel.fromMap(json["media"]),
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/image_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';

class PropertyCategoryModel extends PropertyCategoryEntity {
  PropertyCategoryModel({
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

  factory PropertyCategoryModel.fromJson(String str) =>
      PropertyCategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PropertyCategoryModel.fromMap(Map<String, dynamic> json) =>
      PropertyCategoryModel(
        id: json["_id"],
        media: json["media"] == null ? null : ImageModel.fromMap(json["media"]),
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

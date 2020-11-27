import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/furnishing_entity.dart';

class FurnishingModel extends FurnishingEntity {
  FurnishingModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory FurnishingModel.fromJson(String str) =>
      FurnishingModel.fromMap(json.decode(str));

  factory FurnishingModel.fromMap(Map<String, dynamic> json) => FurnishingModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/image_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/amenity_entity.dart';
import 'dart:convert';

class AmenityModel extends AmenityEntity {
  AmenityModel({
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

  factory AmenityModel.fromJson(String str) =>
      AmenityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AmenityModel.fromMap(Map<String, dynamic> json) => AmenityModel(
        id: json["_id"],
        media: json["media"] == null ? null : ImageModel.fromMap(json["media"]),
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

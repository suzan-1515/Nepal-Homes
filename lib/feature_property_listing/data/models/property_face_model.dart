import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_face_entity.dart';

class PropertyFaceModel extends PropertyFaceEntity {
  PropertyFaceModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory PropertyFaceModel.fromJson(String str) =>
      PropertyFaceModel.fromMap(json.decode(str));

  factory PropertyFaceModel.fromMap(Map<String, dynamic> json) =>
      PropertyFaceModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

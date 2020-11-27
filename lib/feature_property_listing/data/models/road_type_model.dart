import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';

class RoadTypeModel extends RoadTypeEntity {
  RoadTypeModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory RoadTypeModel.fromJson(String str) =>
      RoadTypeModel.fromMap(json.decode(str));

  factory RoadTypeModel.fromMap(Map<String, dynamic> json) => RoadTypeModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/area_unit_entity.dart';
import 'dart:convert';

class AreaUnitModel extends AreaUnitEntity {
  AreaUnitModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory AreaUnitModel.fromJson(String str) =>
      AreaUnitModel.fromMap(json.decode(str));

  factory AreaUnitModel.fromMap(Map<String, dynamic> json) => AreaUnitModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

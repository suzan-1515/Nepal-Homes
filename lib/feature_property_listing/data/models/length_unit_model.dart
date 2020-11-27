import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/length_unit_entity.dart';

class LengthUnitModel extends LengthUnitEntity {
  LengthUnitModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory LengthUnitModel.fromJson(String str) =>
      LengthUnitModel.fromMap(json.decode(str));

  factory LengthUnitModel.fromMap(Map<String, dynamic> json) => LengthUnitModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

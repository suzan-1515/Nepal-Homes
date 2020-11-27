import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/complain_type_entity.dart';

class ComplainTypeModel extends ComplainTypeEntity {
  ComplainTypeModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory ComplainTypeModel.fromJson(String str) =>
      ComplainTypeModel.fromMap(json.decode(str));

  factory ComplainTypeModel.fromMap(Map<String, dynamic> json) =>
      ComplainTypeModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

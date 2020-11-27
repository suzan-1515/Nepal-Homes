import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/calendar_type_entity.dart';

class CalendarTypeModel extends CalendarTypeEntity {
  CalendarTypeModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory CalendarTypeModel.fromJson(String str) =>
      CalendarTypeModel.fromMap(json.decode(str));

  factory CalendarTypeModel.fromMap(Map<String, dynamic> json) =>
      CalendarTypeModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/hot_property_entity.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';

class HotPropertyModel extends HotPropertyEntity {
  HotPropertyModel({
    @required bool success,
    @required String msg,
    @required bool isDeleted,
    @required String id,
    @required List<PropertyEntity> properties,
    @required String propertyType,
    @required String propertyTitle,
  }) : super(
          success: success,
          msg: msg,
          isDeleted: isDeleted,
          id: id,
          properties: properties,
          propertyType: propertyType,
          propertyTitle: propertyTitle,
        );

  factory HotPropertyModel.fromJson(String str) =>
      HotPropertyModel.fromMap(json.decode(str));

  factory HotPropertyModel.fromMap(Map<String, dynamic> json) =>
      HotPropertyModel(
        success: json["success"],
        isDeleted: (json["data"] == null) ? null : json["data"]["is_deleted"],
        id: (json["_id"] == null) ? null : json["data"]["_id"],
        properties: (json["data"] == null)
            ? List<PropertyModel>.empty()
            : json["data"]["properties"]
                ?.map<PropertyModel>((x) => PropertyModel.fromMap(x["id"]))
                ?.toList(),
        propertyType:
            (json["data"] == null) ? null : json["data"]["property_type"],
        propertyTitle:
            (json["data"] == null) ? null : json["data"]["property_title"],
        msg: json["msg"],
      );
}

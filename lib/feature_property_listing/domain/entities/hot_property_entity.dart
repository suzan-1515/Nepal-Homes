import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';

class HotPropertyEntity extends Equatable {
  HotPropertyEntity({
    @required this.success,
    @required this.msg,
    @required this.isDeleted,
    @required this.id,
    @required this.properties,
    @required this.propertyType,
    @required this.propertyTitle,
  });

  final bool success;
  final String msg;
  final bool isDeleted;
  final String id;
  final List<PropertyEntity> properties;
  final String propertyType;
  final String propertyTitle;

  HotPropertyEntity copyWith({
    bool success,
    String msg,
    bool isDeleted,
    String id,
    List<PropertyEntity> properties,
    String propertyType,
    String propertyTitle,
  }) =>
      HotPropertyEntity(
        success: success ?? this.success,
        msg: msg ?? this.msg,
        isDeleted: isDeleted ?? this.isDeleted,
        id: id ?? this.id,
        properties: properties ?? this.properties,
        propertyType: propertyType ?? this.propertyType,
        propertyTitle: propertyTitle ?? this.propertyTitle,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": {
          "is_deleted": isDeleted,
          "_id": id,
          "properties": properties?.map((x) => {"id": x.toMap()})?.toList(),
          "property_type": propertyType,
          "property_title": propertyTitle,
        },
        "msg": msg,
      };

  @override
  List<Object> get props =>
      [success, msg, isDeleted, id, properties, propertyTitle, propertyType];

  @override
  bool get stringify => true;
}

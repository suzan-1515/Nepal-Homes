import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/area_unit_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/length_unit_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_face_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';

class LocationPropertyEntity extends Equatable {
  LocationPropertyEntity({
    @required this.totalAreaUnit,
    @required this.builtAreaUnit,
    @required this.totalArea,
    @required this.builtArea,
    @required this.roadAccessValue,
    @required this.roadAccessLengthUnit,
    @required this.propertyFace,
    @required this.roadAccessRoadType,
  });

  final AreaUnitEntity totalAreaUnit;
  final AreaUnitEntity builtAreaUnit;
  final String totalArea;
  final String builtArea;
  final String roadAccessValue;
  final LengthUnitEntity roadAccessLengthUnit;
  final PropertyFaceEntity propertyFace;
  final RoadTypeEntity roadAccessRoadType;

  LocationPropertyEntity copyWith({
    AreaUnitEntity totalAreaUnit,
    AreaUnitEntity builtAreaUnit,
    String totalArea,
    String builtArea,
    String roadAccessValue,
    LengthUnitEntity roadAccessLengthUnit,
    PropertyFaceEntity propertyFace,
    RoadTypeEntity roadAccessRoadType,
  }) =>
      LocationPropertyEntity(
        totalAreaUnit: totalAreaUnit ?? this.totalAreaUnit,
        builtAreaUnit: builtAreaUnit ?? this.builtAreaUnit,
        totalArea: totalArea ?? this.totalArea,
        builtArea: builtArea ?? this.builtArea,
        roadAccessValue: roadAccessValue ?? this.roadAccessValue,
        roadAccessLengthUnit: roadAccessLengthUnit ?? this.roadAccessLengthUnit,
        propertyFace: propertyFace ?? this.propertyFace,
        roadAccessRoadType: roadAccessRoadType ?? this.roadAccessRoadType,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "total_area_unit": totalAreaUnit == null ? null : totalAreaUnit.toMap(),
        "built_area_unit": builtAreaUnit == null ? null : builtAreaUnit.toMap(),
        "total_area": totalArea,
        "built_area": builtArea,
        "road_access_value": roadAccessValue,
        "road_access_length_unit": roadAccessLengthUnit.toMap(),
        "property_face": propertyFace == null ? null : propertyFace.toMap(),
        "road_access_road_type":
            roadAccessRoadType == null ? null : roadAccessRoadType.toMap(),
      };

  @override
  List<Object> get props => [
        totalAreaUnit,
        totalArea,
        roadAccessValue,
        roadAccessLengthUnit,
        propertyFace,
        roadAccessRoadType
      ];
}

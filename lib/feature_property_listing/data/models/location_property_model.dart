import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/area_unit_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/length_unit_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_face_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/road_type_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/location_property.dart';

class LocationPropertyModel extends LocationPropertyEntity {
  LocationPropertyModel({
    @required AreaUnitModel totalAreaUnit,
    @required AreaUnitModel builtAreaUnit,
    @required String totalArea,
    @required String builtArea,
    @required String roadAccessValue,
    @required LengthUnitModel roadAccessLengthUnit,
    @required PropertyFaceModel propertyFace,
    @required RoadTypeModel roadAccessRoadType,
  });

  factory LocationPropertyModel.fromJson(String str) =>
      LocationPropertyModel.fromMap(json.decode(str));

  factory LocationPropertyModel.fromMap(Map<String, dynamic> json) =>
      LocationPropertyModel(
        totalAreaUnit: json["total_area_unit"] == null
            ? null
            : AreaUnitModel.fromMap(json["total_area_unit"]),
        totalArea: json["total_area"],
        builtArea: json["built_area"],
        builtAreaUnit: json["built_area_unit"] == null
            ? null
            : AreaUnitModel.fromMap(json["built_area_unit"]),
        propertyFace: json["property_face"] == null
            ? null
            : PropertyFaceModel.fromMap(json["property_face"]),
        roadAccessValue: json["road_access_value"],
        roadAccessLengthUnit: json["road_access_length_unit"] == null
            ? null
            : LengthUnitModel.fromMap(json["road_access_length_unit"]),
        roadAccessRoadType: json["road_access_road_type"] == null
            ? null
            : RoadTypeModel.fromMap(json["road_access_road_type"]),
      );
}

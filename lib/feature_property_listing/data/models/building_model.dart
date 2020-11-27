import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/amenity_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/calendar_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/furnishing_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/building_entity.dart';

class BuildingModel extends BuildingEntity {
  BuildingModel({
    @required BuildingRoomCountModel noOf,
    @required List<AmenityModel> amenities,
    @required int builtYear,
    @required int builtMonth,
    @required CalendarTypeModel calendarType,
    @required double totalFloor,
    @required FurnishingModel furnishing,
    @required String parking,
  });

  factory BuildingModel.fromJson(String str) =>
      BuildingModel.fromMap(json.decode(str));

  factory BuildingModel.fromMap(Map<String, dynamic> json) => BuildingModel(
        noOf: json["no_of"] == null
            ? null
            : BuildingRoomCountModel.fromMap(json["no_of"]),
        amenities: json["amenities"] == null
            ? null
            : List<AmenityModel>.from(
                json["amenities"].map((x) => AmenityModel.fromMap(x))),
        builtYear: json["built_year"],
        builtMonth: json["built_month"],
        calendarType: json["calender_type"] == null
            ? null
            : CalendarTypeModel.fromMap(json["calender_type"]),
        totalFloor: json["total_floor"] == null
            ? null
            : double.parse(json["total_floor"].toString()),
        furnishing: json["furnishing"] == null
            ? null
            : FurnishingModel.fromMap(json["furnishing"]),
        parking: json["parking"],
      );
}

class BuildingRoomCountModel extends BuildingRoomCountEntity {
  BuildingRoomCountModel({
    @required int bedroom,
    @required int bathroom,
    @required int kitchen,
    @required int dinningroom,
    @required int hall,
  }) : super(
            bathroom: bathroom,
            bedroom: bedroom,
            kitchen: kitchen,
            dinningroom: dinningroom,
            hall: hall);

  factory BuildingRoomCountModel.fromJson(String str) =>
      BuildingRoomCountModel.fromMap(json.decode(str));

  factory BuildingRoomCountModel.fromMap(Map<String, dynamic> json) =>
      BuildingRoomCountModel(
        kitchen: json["kitchen"],
        dinningroom: json["dinningroom"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        hall: json["hall"],
      );
}

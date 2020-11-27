import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/amenity_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/calendar_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/furnishing_entity.dart';

class BuildingEntity extends Equatable {
  BuildingEntity({
    @required this.noOf,
    @required this.amenities,
    @required this.builtYear,
    @required this.builtMonth,
    @required this.calendarType,
    @required this.totalFloor,
    @required this.furnishing,
    @required this.parking,
  });

  final BuildingRoomCountEntity noOf;
  final List<AmenityEntity> amenities;
  final int builtYear;
  final int builtMonth;
  final CalendarTypeEntity calendarType;
  final double totalFloor;
  final FurnishingEntity furnishing;
  final String parking;

  BuildingEntity copyWith({
    BuildingRoomCountEntity noOf,
    List<AmenityEntity> amenities,
    int builtYear,
    int builtMonth,
    CalendarTypeEntity calendarType,
    double totalFloor,
    FurnishingEntity furnishing,
    String parking,
  }) =>
      BuildingEntity(
        noOf: noOf ?? this.noOf,
        amenities: amenities ?? this.amenities,
        builtYear: builtYear ?? this.builtYear,
        builtMonth: builtMonth ?? this.builtMonth,
        calendarType: calendarType ?? this.calendarType,
        totalFloor: totalFloor ?? this.totalFloor,
        furnishing: furnishing ?? this.furnishing,
        parking: parking ?? this.parking,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "no_of": noOf?.toMap(),
        "amenities": amenities?.map((e) => e.toMap())?.toList(),
        "built_year": builtYear,
        "built_month": builtMonth,
        "calender_type": calendarType?.toMap(),
        "total_floor": totalFloor,
        "furnishing": furnishing?.toMap(),
        "parking": parking,
      };

  @override
  List<Object> get props => [
        noOf,
        builtYear,
        builtMonth,
        totalFloor,
        calendarType,
        furnishing,
        amenities,
        parking
      ];
}

class BuildingRoomCountEntity extends Equatable {
  BuildingRoomCountEntity({
    @required this.bedroom,
    @required this.bathroom,
    @required this.kitchen,
    @required this.dinningroom,
    @required this.hall,
  });

  final int bedroom;
  final int bathroom;
  final int kitchen;
  final int dinningroom;
  final int hall;

  BuildingRoomCountEntity copyWith({
    int bedroom,
    int bathroom,
    int kitchen,
    int dinningroom,
    int hall,
  }) =>
      BuildingRoomCountEntity(
        bedroom: bedroom ?? this.bedroom,
        bathroom: bathroom ?? this.bathroom,
        kitchen: kitchen ?? this.kitchen,
        dinningroom: dinningroom ?? this.dinningroom,
        hall: hall ?? this.hall,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "bedroom": bedroom,
        "bathroom": bathroom,
        "kitchen": kitchen,
        "dinningroom": dinningroom,
        "hall": hall,
      };

  @override
  List<Object> get props => [bedroom, bathroom, kitchen, dinningroom, hall];
}

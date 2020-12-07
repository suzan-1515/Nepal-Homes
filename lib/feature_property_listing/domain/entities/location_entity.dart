import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';

abstract class Location extends Equatable {
  final String id;
  final String name;
  final String slug;
  final bool isActive;

  Location(
      {@required this.id,
      @required this.name,
      @required this.slug,
      @required this.isActive});

  @override
  List<Object> get props => [id, name, slug, isActive];
}

class LocationEntity extends Equatable {
  LocationEntity({
    @required this.states,
    @required this.districts,
    @required this.municipalities,
    @required this.areas,
  });

  final List<StateEntity> states;
  final List<DistrictEntity> districts;
  final List<MunicipalityEntity> municipalities;
  final List<AreaEntity> areas;

  LocationEntity copyWith({
    List<StateEntity> states,
    List<DistrictEntity> districts,
    List<MunicipalityEntity> municipalities,
    List<AreaEntity> areas,
  }) =>
      LocationEntity(
        states: states ?? this.states,
        districts: districts ?? this.districts,
        municipalities: municipalities ?? this.municipalities,
        areas: areas ?? this.areas,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "data": {
          "allState": List<StateEntity>.from(states.map((x) => x.toMap())),
          "allDistrict":
              List<DistrictEntity>.from(districts.map((x) => x.toMap())),
          "allVdc": List<MunicipalityEntity>.from(
              municipalities.map((x) => x.toMap())),
          "allArea": List<AreaEntity>.from(areas.map((x) => x.toMap())),
        },
      };

  @override
  List<Object> get props => [states, districts, municipalities, areas];
}

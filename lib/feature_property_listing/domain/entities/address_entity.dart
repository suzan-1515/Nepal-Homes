import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';

class AddressEntity extends Equatable {
  AddressEntity({
    @required this.state,
    @required this.district,
    @required this.city,
    @required this.area,
  });

  final StateEntity state;
  final DistrictEntity district;
  final MunicipalityEntity city;
  final AreaEntity area;

  AddressEntity copyWith({
    StateEntity stateId,
    DistrictEntity districtId,
    MunicipalityEntity cityId,
    AreaEntity areaId,
  }) =>
      AddressEntity(
        state: stateId ?? this.state,
        district: districtId ?? this.district,
        city: cityId ?? this.city,
        area: areaId ?? this.area,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "state_id": state?.toMap(),
        "district_id": district?.toMap(),
        "city_id": city?.toMap(),
        "area_id": area?.toMap(),
      };

  @override
  List<Object> get props => [state, district, city, area];
}

class StateEntity extends Location {
  StateEntity({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String slug,
  }) : super(id: id, name: name, slug: slug, isActive: isActive);

  StateEntity copyWith({
    String id,
    bool isActive,
    String name,
    String slug,
  }) =>
      StateEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
        slug: slug ?? this.slug,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "name": name,
        "slug": slug,
      };
}

class DistrictEntity extends Location {
  DistrictEntity({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String slug,
    @required this.stateId,
  }) : super(id: id, name: name, slug: slug, isActive: isActive);

  final String stateId;

  DistrictEntity copyWith({
    String id,
    bool isActive,
    String name,
    String stateId,
    String slug,
  }) =>
      DistrictEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
        stateId: stateId ?? this.stateId,
        slug: slug ?? this.slug,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "name": name,
        "state_id": stateId,
        "slug": slug,
      };

  @override
  List<Object> get props => [id, name, isActive, stateId, slug];
}

class MunicipalityEntity extends Location {
  MunicipalityEntity({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String slug,
    @required this.districtId,
  }) : super(id: id, name: name, slug: slug, isActive: isActive);

  final String districtId;

  MunicipalityEntity copyWith({
    String id,
    bool isActive,
    String name,
    String districtId,
    String slug,
  }) =>
      MunicipalityEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
        districtId: districtId ?? this.districtId,
        slug: slug ?? this.slug,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "name": name,
        "district_id": districtId,
        "slug": slug,
      };

  @override
  List<Object> get props => [id, name, isActive, districtId, slug];
}

class AreaEntity extends Location {
  AreaEntity({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String slug,
    @required this.municipalityId,
  }) : super(id: id, name: name, slug: slug, isActive: isActive);

  final String municipalityId;

  AreaEntity copyWith({
    String id,
    bool isActive,
    String name,
    String municipalityId,
    String slug,
  }) =>
      AreaEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
        municipalityId: municipalityId ?? this.municipalityId,
        slug: slug ?? this.slug,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "name": name,
        "vdcmunicipality_id": municipalityId,
        "slug": slug,
      };

  @override
  List<Object> get props => [id, name, isActive, municipalityId, slug];
}

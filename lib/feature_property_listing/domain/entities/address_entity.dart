import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

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

class StateEntity extends Equatable {
  StateEntity({
    @required this.id,
    @required this.isActive,
    @required this.name,
    @required this.slug,
  });

  final String id;
  final bool isActive;
  final String name;
  final String slug;

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

  @override
  List<Object> get props => [name, id, isActive, slug];
}

class DistrictEntity extends Equatable {
  DistrictEntity({
    @required this.id,
    @required this.isActive,
    @required this.name,
    @required this.stateId,
    @required this.slug,
  });

  final String id;
  final bool isActive;
  final String name;
  final String stateId;
  final String slug;

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

class MunicipalityEntity extends Equatable {
  MunicipalityEntity({
    @required this.id,
    @required this.isActive,
    @required this.name,
    @required this.districtId,
    @required this.slug,
  });

  final String id;
  final bool isActive;
  final String name;
  final String districtId;
  final String slug;

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

class AreaEntity extends Equatable {
  AreaEntity({
    @required this.id,
    @required this.isActive,
    @required this.name,
    @required this.municipalityId,
    @required this.slug,
  });

  final String id;
  final bool isActive;
  final String name;
  final String municipalityId;
  final String slug;

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

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    @required StateModel state,
    @required DistrictModel district,
    @required MunicipalityModel city,
    @required AreaModel area,
  }) : super(state: state, district: district, city: city, area: area);

  factory AddressModel.fromJson(String str) =>
      AddressModel.fromMap(json.decode(str));

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        state: json["state_id"] == null
            ? null
            : StateModel.fromMap(json["state_id"]),
        district: json["district_id"] == null
            ? null
            : DistrictModel.fromMap(json["district_id"]),
        city: json["city_id"] == null
            ? null
            : MunicipalityModel.fromMap(json["city_id"]),
        area:
            json["area_id"] == null ? null : AreaModel.fromMap(json["area_id"]),
      );
}

class StateModel extends StateEntity {
  StateModel({
    @required String name,
    @required String id,
    @required bool isActive,
    @required String slug,
  }) : super(id: id, name: name, isActive: isActive, slug: slug);

  factory StateModel.fromJson(String str) =>
      StateModel.fromMap(json.decode(str));

  factory StateModel.fromMap(Map<String, dynamic> json) => StateModel(
        id: json["_id"],
        isActive: json["is_active"],
        name: json["name"],
        slug: json["slug"],
      );
}

class DistrictModel extends DistrictEntity {
  DistrictModel({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String stateId,
    @required String slug,
  }) : super(
            id: id,
            isActive: isActive,
            name: name,
            stateId: stateId,
            slug: slug);

  factory DistrictModel.fromJson(String str) =>
      DistrictModel.fromMap(json.decode(str));

  factory DistrictModel.fromMap(Map<String, dynamic> json) => DistrictModel(
        id: json["_id"],
        isActive: json["is_active"],
        name: json["name"],
        stateId: json["state_id"],
        slug: json["slug"],
      );
}

class MunicipalityModel extends MunicipalityEntity {
  MunicipalityModel({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String districtId,
    @required String slug,
  }) : super(
            id: id,
            isActive: isActive,
            name: name,
            districtId: districtId,
            slug: slug);

  factory MunicipalityModel.fromJson(String str) =>
      MunicipalityModel.fromMap(json.decode(str));

  factory MunicipalityModel.fromMap(Map<String, dynamic> json) =>
      MunicipalityModel(
        id: json["_id"],
        isActive: json["is_active"],
        name: json["name"],
        districtId: json["district_id"],
        slug: json["slug"],
      );
}

class AreaModel extends AreaEntity {
  AreaModel({
    @required String id,
    @required bool isActive,
    @required String name,
    @required String municipalityId,
    @required String slug,
  }) : super(
            id: id,
            isActive: isActive,
            name: name,
            municipalityId: municipalityId,
            slug: slug);

  factory AreaModel.fromJson(String str) => AreaModel.fromMap(json.decode(str));

  factory AreaModel.fromMap(Map<String, dynamic> json) => AreaModel(
        id: json["_id"],
        isActive: json["is_active"],
        name: json["name"],
        municipalityId: json["vdcmunicipality_id"],
        slug: json["slug"],
      );
}

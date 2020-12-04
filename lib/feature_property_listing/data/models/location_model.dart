import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/address_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    @required List<StateModel> states,
    @required List<DistrictModel> districts,
    @required List<MunicipalityModel> municipalities,
    @required List<AreaModel> areas,
  }) : super(
            states: states,
            districts: districts,
            municipalities: municipalities,
            areas: areas);

  factory LocationModel.fromJson(String str) =>
      LocationModel.fromMap(json.decode(str));

  factory LocationModel.fromMap(Map<String, dynamic> json) {
    if (json['data'] == null) return null;
    return LocationModel(
      states: json["data"]["allState"] == null
          ? null
          : json["data"]["allState"].map((x) => StateModel.fromMap(x)).toList(),
      districts: json["data"]["allDistrict"] == null
          ? null
          : json["data"]["allDistrict"]
              .map((x) => DistrictModel.fromMap(x))
              .toList(),
      municipalities: json["data"]["allVdc"] == null
          ? null
          : json["data"]["allVdc"]
              .map((x) => MunicipalityModel.fromMap(x))
              .toList(),
      areas: json["data"]["allArea"] == null
          ? null
          : json["data"]["allArea"].map((x) => AreaModel.fromMap(x)).toList(),
    );
  }
}

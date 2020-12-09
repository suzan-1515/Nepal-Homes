import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nepal_homes/core/models/nullable.dart';

class PropertyQuery extends Equatable {
  final int sort;
  final int page;
  final String agencyId;
  final String areaId;
  final String districtId;
  final String stateId;
  final String municipalityId;
  final String propertyPurposeId;
  final bool isPremium;
  final bool isFeatured;
  final String propertyCategoryId;
  final String propertyTypeId;
  final int priceRanceId;
  final String roadType;
  PropertyQuery({
    this.sort,
    this.page,
    this.agencyId,
    this.areaId,
    this.districtId,
    this.stateId,
    this.municipalityId,
    this.propertyPurposeId,
    this.isPremium,
    this.isFeatured,
    this.propertyCategoryId,
    this.propertyTypeId,
    this.priceRanceId,
    this.roadType,
  });

  @override
  List<Object> get props {
    return [
      sort,
      page,
      agencyId,
      areaId,
      districtId,
      stateId,
      municipalityId,
      propertyPurposeId,
      isPremium,
      isFeatured,
      propertyCategoryId,
      propertyTypeId,
      priceRanceId,
      roadType,
    ];
  }

  PropertyQuery copyWith({
    Nullable<int> sort,
    Nullable<int> page,
    Nullable<String> agencyId,
    Nullable<String> areaId,
    Nullable<String> districtId,
    Nullable<String> stateId,
    Nullable<String> municipalityId,
    Nullable<String> propertyPurposeId,
    Nullable<bool> isPremium,
    Nullable<bool> isFeatured,
    Nullable<String> propertyCategoryId,
    Nullable<String> propertyTypeId,
    Nullable<int> priceRanceId,
    Nullable<String> roadType,
  }) {
    return PropertyQuery(
      sort: sort == null ? this.sort : sort.value,
      page: page == null ? this.page : page.value,
      agencyId: agencyId == null ? this.agencyId : agencyId.value,
      areaId: areaId == null ? this.areaId : areaId.value,
      districtId: districtId == null ? this.districtId : districtId.value,
      stateId: stateId == null ? this.stateId : stateId.value,
      municipalityId:
          municipalityId == null ? this.municipalityId : municipalityId.value,
      propertyPurposeId: propertyPurposeId == null
          ? this.propertyPurposeId
          : propertyPurposeId.value,
      isPremium: isPremium == null ? this.isPremium : isPremium.value,
      isFeatured: isFeatured == null ? this.isFeatured : isFeatured.value,
      propertyCategoryId: propertyCategoryId == null
          ? this.propertyCategoryId
          : propertyCategoryId.value,
      propertyTypeId:
          propertyTypeId == null ? this.propertyTypeId : propertyTypeId.value,
      priceRanceId:
          priceRanceId == null ? this.priceRanceId : priceRanceId.value,
      roadType: roadType == null ? this.roadType : roadType.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sort': sort?.toString(),
      'page': page?.toString(),
      'agency_id': agencyId,
      'find_area_id': areaId,
      'find_district_id': districtId,
      'find_state_id': stateId,
      'find_vdc_id': municipalityId,
      'find_property_purpose': propertyPurposeId,
      'find_is_premium': isPremium?.toString()?.toLowerCase(),
      'find_is_featured': isFeatured?.toString()?.toLowerCase(),
      'find_property_category': propertyCategoryId,
      'find_property_type': propertyTypeId,
      'find_selected_price': priceRanceId?.toString(),
      'find_road_access_road_type': roadType,
    };
  }

  factory PropertyQuery.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PropertyQuery(
      sort: map['sort'],
      page: map['page'],
      agencyId: map['agency_id'],
      areaId: map['find_area_id'],
      districtId: map['find_district_id'],
      stateId: map['find_state_id'],
      propertyPurposeId: map['find_property_purpose'],
      isPremium: map['find_is_premium'],
      isFeatured: map['find_is_featured'],
      propertyCategoryId: map['find_property_category'],
      propertyTypeId: map['find_property_type'],
      priceRanceId: map['find_selected_price'],
      roadType: map['find_road_access_road_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyQuery.fromJson(String source) =>
      PropertyQuery.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}

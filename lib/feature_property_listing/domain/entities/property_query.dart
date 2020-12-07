import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyQuery extends Equatable {
  final int sort;
  final int page;
  final String agencyId;
  final bool isProject;
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
    this.sort = 1,
    this.page = 1,
    this.agencyId,
    this.isProject,
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
      isProject,
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
    int sort,
    int page,
    String agencyId,
    bool isProperty,
    String areaId,
    String districtId,
    String stateId,
    String municipalityId,
    String propertyPurposeId,
    bool isPremium,
    bool isFeatured,
    String propertyCategoryId,
    String propertyTypeId,
    int priceRanceId,
    String roadType,
  }) {
    return PropertyQuery(
      sort: sort ?? this.sort,
      page: page ?? this.page,
      agencyId: agencyId ?? this.agencyId,
      isProject: isProperty ?? this.isProject,
      areaId: areaId ?? this.areaId,
      districtId: districtId ?? this.districtId,
      stateId: stateId ?? this.stateId,
      municipalityId: municipalityId ?? this.municipalityId,
      propertyPurposeId: propertyPurposeId ?? this.propertyPurposeId,
      isPremium: isPremium ?? this.isPremium,
      isFeatured: isFeatured ?? this.isFeatured,
      propertyCategoryId: propertyCategoryId ?? this.propertyCategoryId,
      propertyTypeId: propertyTypeId ?? this.propertyTypeId,
      priceRanceId: priceRanceId ?? this.priceRanceId,
      roadType: roadType ?? this.roadType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sort': sort?.toString(),
      'page': page?.toString(),
      'agency_id': agencyId,
      'is_project': isProject?.toString()?.toLowerCase(),
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
      isProject: map['is_project'],
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

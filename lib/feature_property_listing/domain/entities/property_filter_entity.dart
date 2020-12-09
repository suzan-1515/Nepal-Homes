import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';

class PropertyFilterEntity extends Equatable {
  PropertyFilterEntity({
    @required this.propertyMeta,
    this.propertyPurpose,
    this.roadType,
    this.propertyCategory,
    this.propertyType,
    this.location,
    this.priceRange,
    this.isPremium,
    this.isFeatured,
    this.sort,
  });

  final PropertyMetaEntity propertyMeta;
  final PropertyPurposeEntity propertyPurpose;
  final RoadTypeEntity roadType;
  final PropertyCategoryEntity propertyCategory;
  final PropertyTypeEntity propertyType;
  final Location location;
  final int priceRange;
  final bool isPremium;
  final bool isFeatured;
  final int sort;

  @override
  List<Object> get props {
    return [
      propertyMeta,
      propertyPurpose,
      roadType,
      propertyCategory,
      propertyType,
      location,
      priceRange,
      isPremium,
      isFeatured,
      sort,
    ];
  }

  PropertyFilterEntity copyWith({
    PropertyMetaEntity propertyMeta,
    Nullable<PropertyPurposeEntity> propertyPurpose,
    Nullable<RoadTypeEntity> roadType,
    Nullable<PropertyCategoryEntity> propertyCategory,
    Nullable<PropertyTypeEntity> propertyType,
    Nullable<Location> location,
    Nullable<int> priceRange,
    Nullable<bool> isPremium,
    Nullable<bool> isFeatured,
    Nullable<int> sort,
  }) {
    return PropertyFilterEntity(
        propertyMeta: propertyMeta ?? this.propertyMeta,
        propertyPurpose: propertyPurpose == null
            ? this.propertyPurpose
            : propertyPurpose.value,
        roadType: roadType == null ? this.roadType : roadType.value,
        propertyCategory: propertyCategory == null
            ? this.propertyCategory
            : propertyCategory.value,
        propertyType:
            propertyType == null ? this.propertyType : propertyType.value,
        location: location == null ? this.location : location.value,
        priceRange: priceRange == null ? this.priceRange : priceRange.value,
        isPremium: isPremium == null ? this.isPremium : isPremium.value,
        isFeatured: isFeatured == null ? this.isFeatured : isFeatured.value,
        sort: sort == null ? this.sort : sort.value);
  }

  @override
  bool get stringify => true;
}

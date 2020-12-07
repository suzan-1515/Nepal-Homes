import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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
    PropertyPurposeEntity propertyPurpose,
    RoadTypeEntity roadType,
    PropertyCategoryEntity propertyCategory,
    PropertyTypeEntity propertyType,
    Location location,
    int priceRange,
    bool isPremium,
    bool isFeatured,
    int sort,
  }) {
    return PropertyFilterEntity(
      propertyMeta: propertyMeta ?? this.propertyMeta,
      propertyPurpose: propertyPurpose ?? this.propertyPurpose,
      roadType: roadType ?? this.roadType,
      propertyCategory: propertyCategory ?? this.propertyCategory,
      propertyType: propertyType ?? this.propertyType,
      location: location ?? this.location,
      priceRange: priceRange ?? this.priceRange,
      isPremium: isPremium ?? this.isPremium,
      isFeatured: isFeatured ?? this.isFeatured,
      sort: sort ?? this.sort,
    );
  }

  @override
  bool get stringify => true;
}

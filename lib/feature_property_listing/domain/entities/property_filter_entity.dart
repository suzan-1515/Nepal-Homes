import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/amenity_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/furnishing_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/ownership_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_feature_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_status_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_face_entity.dart';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/service_category_entity.dart';

class PropertyFilter extends Equatable {
  PropertyFilter({
    this.serviceCategories,
    this.propertyFaces,
    @required this.propertyPurposes,
    @required this.roadTypes,
    @required this.projectFeatures,
    @required this.propertyCategories,
    @required this.propertyTypes,
    this.ownershipTypes,
    this.projectStatus,
    this.furnishing,
    this.amenities,
    this.locations,
    this.priceRange,
    this.isPremium,
    this.isFeatured,
  });

  final List<ServiceCategoryEntity> serviceCategories;
  final List<PropertyFaceEntity> propertyFaces;
  final List<PropertyPurposeEntity> propertyPurposes;
  final List<RoadTypeEntity> roadTypes;
  final List<ProjectFeatureEntity> projectFeatures;
  final List<PropertyCategoryEntity> propertyCategories;
  final List<PropertyTypeEntity> propertyTypes;
  final List<OwnershipTypeEntity> ownershipTypes;
  final List<ProjectStatusEntity> projectStatus;
  final List<FurnishingEntity> furnishing;
  final List<AmenityEntity> amenities;
  final List<LocationEntity> locations;
  final int priceRange;
  final bool isPremium;
  final bool isFeatured;

  PropertyFilter copyWith({
    List<ServiceCategoryEntity> serviceCategories,
    List<PropertyFaceEntity> propertyFaces,
    List<PropertyPurposeEntity> propertyPurposes,
    List<RoadTypeEntity> roadTypes,
    List<ProjectFeatureEntity> projectFeatures,
    List<PropertyCategoryEntity> propertyCategories,
    List<PropertyTypeEntity> propertyTypes,
    List<OwnershipTypeEntity> ownershipTypes,
    List<ProjectStatusEntity> projectStatus,
    List<FurnishingEntity> furnishing,
    List<AmenityEntity> amenities,
    List<LocationEntity> locations,
    int priceRange,
    bool isPremium,
    bool isFeatured,
  }) =>
      PropertyFilter(
        serviceCategories: serviceCategories ?? this.serviceCategories,
        propertyFaces: propertyFaces ?? this.propertyFaces,
        propertyPurposes: propertyPurposes ?? this.propertyPurposes,
        roadTypes: roadTypes ?? this.roadTypes,
        projectFeatures: projectFeatures ?? this.projectFeatures,
        propertyCategories: propertyCategories ?? this.propertyCategories,
        propertyTypes: propertyTypes ?? this.propertyTypes,
        ownershipTypes: ownershipTypes ?? this.ownershipTypes,
        projectStatus: projectStatus ?? this.projectStatus,
        furnishing: furnishing ?? this.furnishing,
        amenities: amenities ?? this.amenities,
        locations: locations ?? this.locations,
        priceRange: priceRange ?? this.priceRange,
        isPremium: isPremium ?? this.isPremium,
        isFeatured: isFeatured ?? this.isFeatured,
      );

  @override
  List<Object> get props => [];
}

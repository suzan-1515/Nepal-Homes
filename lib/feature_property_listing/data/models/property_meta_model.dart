import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/amenity_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/furnishing_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/ownership_type_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/project_feature_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/project_status_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_category_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_face_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_purpose_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_type_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/road_type_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/service_category_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/amenity_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/furnishing_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/ownership_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_feature_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_status_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_face_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/service_category_entity.dart';

class PropertyMetaModel extends PropertyMetaEntity {
  PropertyMetaModel({
    @required List<ServiceCategoryEntity> serviceCategories,
    @required List<PropertyFaceEntity> propertyFaces,
    @required List<PropertyPurposeEntity> propertyPurposes,
    @required List<RoadTypeEntity> roadTypes,
    @required List<ProjectFeatureEntity> projectFeatures,
    @required List<PropertyCategoryEntity> propertyCategories,
    @required List<PropertyTypeEntity> propertyTypes,
    @required List<OwnershipTypeEntity> ownershipTypes,
    @required List<ProjectStatusEntity> projectStatus,
    @required List<FurnishingEntity> furnishing,
    @required List<AmenityEntity> amenities,
  }) : super(
          serviceCategories: serviceCategories,
          propertyFaces: propertyFaces,
          propertyPurposes: propertyPurposes,
          roadTypes: roadTypes,
          projectFeatures: projectFeatures,
          propertyCategories: propertyCategories,
          propertyTypes: propertyTypes,
          ownershipTypes: ownershipTypes,
          projectStatus: projectStatus,
          furnishing: furnishing,
          amenities: amenities,
        );

  factory PropertyMetaModel.fromJson(String str) =>
      PropertyMetaModel.fromMap(json.decode(str));

  factory PropertyMetaModel.fromMap(Map<String, dynamic> json) {
    if (json == null || json['data'] == null) return null;
    return PropertyMetaModel(
      serviceCategories: json["data"]['service_category'] == null
          ? null
          : json["data"]['service_category']
              .map<ServiceCategoryModel>((e) => ServiceCategoryModel.fromMap(e))
              .toList(),
      propertyFaces: json["data"]['property_face'] == null
          ? null
          : json["data"]['property_face']
              .map<PropertyFaceModel>((e) => PropertyFaceModel.fromMap(e))
              .toList(),
      propertyPurposes: json["data"]['property_purpose'] == null
          ? null
          : json["data"]['property_purpose']
              .map<PropertyPurposeModel>((e) => PropertyPurposeModel.fromMap(e))
              .toList(),
      roadTypes: json["data"]['road_type'] == null
          ? null
          : json["data"]['road_type']
              .map<RoadTypeModel>((e) => RoadTypeModel.fromMap(e))
              .toList(),
      projectFeatures: json["data"]['project_features'] == null
          ? null
          : json["data"]['project_features']
              .map<ProjectFeatureModel>((e) => ProjectFeatureModel.fromMap(e))
              .toList(),
      propertyCategories: json["data"]['property_category'] == null
          ? null
          : json["data"]['property_category']
              .map<PropertyCategoryModel>(
                  (e) => PropertyCategoryModel.fromMap(e))
              .toList(),
      propertyTypes: json["data"]['property_type'] == null
          ? null
          : json["data"]['property_type']
              .map<PropertyTypeModel>((e) => PropertyTypeModel.fromMap(e))
              .toList(),
      ownershipTypes: json["data"]['ownership_type'] == null
          ? null
          : json["data"]['ownership_type']
              .map<OwnershipTypeModel>((e) => OwnershipTypeModel.fromMap(e))
              .toList(),
      projectStatus: json["data"]['project_status'] == null
          ? null
          : json["data"]['project_status']
              .map<ProjectStatusModel>((e) => ProjectStatusModel.fromMap(e))
              .toList(),
      furnishing: json["data"]['furnishing'] == null
          ? null
          : json["data"]['furnishing']
              .map<FurnishingModel>((e) => FurnishingModel.fromMap(e))
              .toList(),
      amenities: json["data"]['amenities'] == null
          ? null
          : json["data"]['amenities']
              .map<AmenityModel>((e) => AmenityModel.fromMap(e))
              .toList(),
    );
  }
}

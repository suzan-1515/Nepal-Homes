import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/ownership_type_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_category_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_purpose_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_type_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/baisc_entity.dart';

class BasicModel extends BasicEntity {
  BasicModel({
    @required String title,
    @required String description,
    @required PropertyPurposeModel propertyPurpose,
    @required PropertyCategoryModel propertyCategory,
    @required OwnershipTypeModel ownershipType,
    @required List<PropertyTypeModel> propertyTypes,
  }) : super(
          title: title,
          description: description,
          propertyCategory: propertyCategory,
          propertyPurpose: propertyPurpose,
          propertyTypes: propertyTypes,
          propertyOwnership: ownershipType,
        );

  factory BasicModel.fromJson(String str) =>
      BasicModel.fromMap(json.decode(str));

  factory BasicModel.fromMap(Map<String, dynamic> json) => BasicModel(
        propertyTypes: json["property_type"] == null
            ? null
            : List<PropertyTypeModel>.from(
                json["property_type"].map((x) => PropertyTypeModel.fromMap(x))),
        title: json["title"],
        description: json["description"],
        propertyPurpose: json["property_purpose"] == null
            ? null
            : PropertyPurposeModel.fromMap(json["property_purpose"]),
        propertyCategory: json["property_category"] == null
            ? null
            : PropertyCategoryModel.fromMap(json["property_category"]),
        ownershipType: json["property_ownership"] == null
            ? null
            : OwnershipTypeModel.fromMap(json["property_ownership"]),
      );
}

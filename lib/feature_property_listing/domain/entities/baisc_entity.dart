import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/ownership_type_entity.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';

class BasicEntity extends Equatable {
  BasicEntity({
    @required this.title,
    @required this.description,
    @required this.propertyPurpose,
    @required this.propertyCategory,
    @required this.propertyTypes,
    @required this.propertyOwnership,
  });

  final String title;
  final String description;
  final PropertyPurposeEntity propertyPurpose;
  final PropertyCategoryEntity propertyCategory;
  final List<PropertyTypeEntity> propertyTypes;
  final OwnershipTypeEntity propertyOwnership;

  BasicEntity copyWith({
    String title,
    String description,
    PropertyPurposeEntity propertyPurpose,
    PropertyCategoryEntity propertyCategory,
    List<PropertyTypeEntity> propertyTypes,
    OwnershipTypeEntity propertyOwnership,
  }) =>
      BasicEntity(
        title: title ?? this.title,
        description: description ?? this.description,
        propertyPurpose: propertyPurpose ?? this.propertyPurpose,
        propertyCategory: propertyCategory ?? this.propertyCategory,
        propertyTypes: propertyTypes ?? this.propertyTypes,
        propertyOwnership: propertyOwnership ?? this.propertyOwnership,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "property_purpose": propertyPurpose?.toMap(),
        "property_category": propertyCategory?.toMap(),
        "property_type": propertyTypes?.map((e) => e.toMap())?.toList(),
        "property_ownership": propertyOwnership?.toMap(),
      };

  @override
  List<Object> get props => [
        title,
        description,
        propertyPurpose,
        propertyCategory,
        propertyTypes,
        propertyOwnership
      ];
}

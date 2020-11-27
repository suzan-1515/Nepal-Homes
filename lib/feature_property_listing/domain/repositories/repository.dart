import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

mixin Repository {
  Future<PaginatedPropertyEntity> getProperties(
      {@required PropertyQuery query});
  Future<PaginatedPropertyEntity> getPropertiesByAgency(
      {@required PropertyQuery query});
  Future<PropertyDetailWrapperEntity> getPropertyDetail(
      {@required String slug});
}

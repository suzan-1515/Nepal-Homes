import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/featured_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/hot_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

mixin Repository {
  Future<PaginatedPropertyEntity> getProperties(
      {@required PropertyQuery query});
  Future<HotPropertyEntity> getHotProperties();
  Future<FeaturedPropertyEntity> getFeaturedProperties();
  Future<PaginatedPropertyEntity> getRecentProperties();
  Future<PaginatedPropertyEntity> getPremiumProperties();
  Future<PaginatedPropertyEntity> getPropertiesByAgency(
      {@required PropertyQuery query});
  Future<PropertyDetailWrapperEntity> getPropertyDetail(
      {@required String slug});
  Future<PropertyMetaEntity> getPropertyMetas();
  Future<List<PropertyCategoryEntity>> getPropertyCategories();
  Future<LocationEntity> getLocations();
}

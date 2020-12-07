import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/location_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_meta_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

mixin RemoteDataSource {
  Future<PaginatedPropertyModel> fetchProperties(
      {@required PropertyQuery query});
  Future<PropertyDetailWrapperModel> fetchPropertyDetail(
      {@required String slug});
  Future<PaginatedPropertyModel> fetchPropertiesByAgency(
      {@required PropertyQuery query});
  Future<PropertyMetaModel> fetchPropertyMetas();
  Future<LocationModel> fetchLocations();
}

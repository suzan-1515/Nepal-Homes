import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_property_listing/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/data/models/location_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_meta_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/featured_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/hot_property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class PropertyRepository with Repository {
  final RemoteDataSource _remoteDataSource;
  final AnalyticsService _analyticsService;
  final NetworkInfo _networkInfo;

  PropertyRepository(
      this._remoteDataSource, this._analyticsService, this._networkInfo);

  @override
  Future<PropertyDetailWrapperEntity> getPropertyDetail({String slug}) async {
    return _remoteDataSource.fetchPropertyDetail(slug: slug);
  }

  @override
  Future<PaginatedPropertyEntity> getProperties({PropertyQuery query}) async {
    return _remoteDataSource.fetchProperties(query: query);
  }

  @override
  Future<PaginatedPropertyEntity> getPropertiesByAgency(
      {PropertyQuery query}) async {
    return _remoteDataSource.fetchPropertiesByAgency(query: query);
  }

  @override
  Future<LocationEntity> getLocations() async {
    return _remoteDataSource.fetchLocations();
  }

  @override
  Future<PropertyMetaEntity> getPropertyMetas() async {
    var results = await Future.wait([
      _remoteDataSource.fetchPropertyMetas(),
      _remoteDataSource.fetchLocations()
    ]);
    PropertyMetaModel propertyMetaModel = results[0];
    LocationModel locationModel = results[1];

    return propertyMetaModel.copyWith(location: locationModel);
  }

  @override
  Future<FeaturedPropertyEntity> getFeaturedProperties() async {
    return _remoteDataSource.fetchFeaturedProperties();
  }

  @override
  Future<HotPropertyEntity> getHotProperties() async {
    return _remoteDataSource.fetchHotProperties();
  }

  @override
  Future<PaginatedPropertyEntity> getPremiumProperties() async {
    return _remoteDataSource.fetchPremiumProperties();
  }

  @override
  Future<PaginatedPropertyEntity> getRecentProperties() async {
    return _remoteDataSource.fetchRecentProperties();
  }

  @override
  Future<List<PropertyCategoryEntity>> getPropertyCategories() async {
    return _remoteDataSource.fetchPropertyCategories();
  }
}

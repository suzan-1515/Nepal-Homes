import 'package:nepal_homes/core/exceptions/app_exceptions.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_property_listing/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';

class PropertyRepository with Repository {
  final RemoteDataSource _remoteDataSource;
  final AnalyticsService _analyticsService;
  final NetworkInfo _networkInfo;

  PropertyRepository(
      this._remoteDataSource, this._analyticsService, this._networkInfo);

  @override
  Future<PropertyDetailWrapperEntity> getPropertyDetail({String slug}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchPropertyDetail(slug: slug);
  }

  @override
  Future<PaginatedPropertyEntity> getProperties({PropertyQuery query}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchProperties(query: query);
  }

  @override
  Future<PaginatedPropertyEntity> getPropertiesByAgency(
      {PropertyQuery query}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchPropertiesByAgency(query: query);
  }
}

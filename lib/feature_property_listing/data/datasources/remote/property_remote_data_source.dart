import 'package:nepal_homes/feature_property_listing/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/data/models/location_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_meta_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

class PropertyRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  PropertyRemoteDataSource(this._remoteService);

  @override
  Future<PaginatedPropertyModel> fetchProperties({PropertyQuery query}) async {
    var response = await _remoteService.fetchProperties(query: query);
    return PaginatedPropertyModel.fromMap(response);
  }

  @override
  Future<PaginatedPropertyModel> fetchPropertiesByAgency(
      {PropertyQuery query}) async {
    var response = await _remoteService.fetchPropertiesByAgency(query: query);
    return PaginatedPropertyModel.fromMap(response);
  }

  @override
  Future<PropertyDetailWrapperModel> fetchPropertyDetail({String slug}) async {
    var response = await _remoteService.fetchPropertyDetail(slug: slug);
    return PropertyDetailWrapperModel.fromMap(response);
  }

  @override
  Future<LocationModel> fetchLocations() async {
    var response = await _remoteService.fetchLocations();
    return LocationModel.fromMap(response);
  }

  @override
  Future<PropertyMetaModel> fetchPropertyMetas() async {
    var response = await _remoteService.fetchPropertyMetas();
    return PropertyMetaModel.fromMap(response);
  }
}

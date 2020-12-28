import 'package:nepal_homes/feature_property_listing/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/data/models/hot_property_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/featured_property_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/location_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_category_model.dart';
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

  @override
  Future<FeaturedPropertyModel> fetchFeaturedProperties() async {
    var response = await _remoteService.fetchFeaturedProperties();
    return FeaturedPropertyModel.fromMap(response);
  }

  @override
  Future<HotPropertyModel> fetchHotProperties() async {
    var response = await _remoteService.fetchHotProperties();
    return HotPropertyModel.fromMap(response);
  }

  @override
  Future<PaginatedPropertyModel> fetchPremiumProperties() async {
    var response = await _remoteService.fetchPremiumProperties();
    return PaginatedPropertyModel.fromMap(response);
  }

  @override
  Future<PaginatedPropertyModel> fetchRecentProperties() async {
    var response = await _remoteService.fetchRecentProperties();
    return PaginatedPropertyModel.fromMap(response);
  }

  @override
  Future<List<PropertyCategoryModel>> fetchPropertyCategories() async{
    var response = await _remoteService.fetchPropertyCategories();
    return response['data']['property_category']?.map<PropertyCategoryModel>((e)=>PropertyCategoryModel.fromMap(e))?.toList();
  }
}

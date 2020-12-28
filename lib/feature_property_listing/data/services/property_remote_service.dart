import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_property_listing/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

class PropertyRemoteService with RemoteService {
  static const PROPERTY_ENDPOINT = '/property/public/data';
  static const FEATURED_PROPERTY_ENDPOINT = '/property/type/featured_property';
  static const HOT_PROPERTY_ENDPOINT = '/property/type/hot_property';
  static const META_ENDPOINT = '/enum';
  static const LOCATION_ENDPOINT = '/static/nepal/all';
  final HttpManager _httpManager;

  PropertyRemoteService(this._httpManager);

  @override
  Future fetchPropertyDetail({String slug}) {
    var path = '$PROPERTY_ENDPOINT/$slug';
    return _httpManager.get(path: path);
  }

  @override
  Future fetchProperties({PropertyQuery query})  {
    // Map<String, String> headers = {
    //   'Authorization': 'Bearer $token',
    // };


    return _httpManager.get(path: PROPERTY_ENDPOINT, query: query.toMap());
  }

  @override
  Future fetchPropertiesByAgency({PropertyQuery query}) {
    Map<String, String> q = {
      'agency_id': query.agencyId,
      'sort': query.sort?.toString(),
      'find_property_purpose': query.propertyPurposeId,
    };
    return _httpManager.get(path: PROPERTY_ENDPOINT, query: q);
  }

  @override
  Future fetchPropertyMetas() {
    return _httpManager.get(path: META_ENDPOINT);
  }

  @override
  Future fetchLocations() {
    return _httpManager.get(path: LOCATION_ENDPOINT);
  }

  @override
  Future fetchFeaturedProperties() {
    return _httpManager.get(path: FEATURED_PROPERTY_ENDPOINT);
  }

  @override
  Future fetchHotProperties() {
    return _httpManager.get(path: HOT_PROPERTY_ENDPOINT);
  }

  @override
  Future fetchPremiumProperties() {
    Map<String, String> q = {
      'find_is_premium': 'true',
    };
    return _httpManager.get(path: PROPERTY_ENDPOINT, query: q);
  }

  @override
  Future fetchRecentProperties()  {
    Map<String, String> q = {
      'size': '4',
    };
    return _httpManager.get(path: PROPERTY_ENDPOINT, query: q);
  }

  @override
  Future fetchPropertyCategories(){
    return _httpManager.get(path: META_ENDPOINT);
  }
}

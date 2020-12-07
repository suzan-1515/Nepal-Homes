import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_property_listing/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

class PropertyRemoteService with RemoteService {
  static const PROPERTY_ENDPOINT = '/property/public/data';
  static const META_ENDPOINT = '/enum';
  static const LOCATION_ENDPOINT = '/static/nepal/all';
  final HttpManager _httpManager;

  PropertyRemoteService(this._httpManager);

  @override
  Future fetchPropertyDetail({String slug}) async {
    var path = '$PROPERTY_ENDPOINT/$slug';
    var call = await _httpManager.get(path: path);

    return call;
  }

  @override
  Future fetchProperties({PropertyQuery query}) async {
    // Map<String, String> headers = {
    //   'Authorization': 'Bearer $token',
    // };
    var call =
        await _httpManager.get(path: PROPERTY_ENDPOINT, query: query.toMap());

    return call;
  }

  @override
  Future fetchPropertiesByAgency({PropertyQuery query}) async {
    Map<String, String> q = {
      'agency_id': query.agencyId,
      'sort': query.sort?.toString(),
      'find_property_purpose': query.propertyPurposeId,
    };
    var call = await _httpManager.get(path: PROPERTY_ENDPOINT, query: q);
    return call;
  }

  @override
  Future fetchPropertyMetas() async {
    var call = await _httpManager.get(path: META_ENDPOINT);
    return call;
  }

  @override
  Future fetchLocations() async {
    var call = await _httpManager.get(path: LOCATION_ENDPOINT);
    return call;
  }
}

import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_agencies/data/services/remote_service.dart';

class AgencyRemoteService with RemoteService {
  static const AGENCIES_ENDPOINT = '/agency/public';
  final HttpManager _httpManager;

  AgencyRemoteService(this._httpManager);
  @override
  Future fetchAgencies({PageConfig pageConfig}) async {
    // Map<String, String> headers = {
    //   'Authorization': 'Bearer $token',
    // };
    Map<String, String> query = {
      'page': pageConfig.page.toString(),
      'size': pageConfig.pageSize.toString(),
    };
    var call = await _httpManager.get(path: AGENCIES_ENDPOINT, query: query);

    return call;
  }

  @override
  Future fetchAgencyDetail({String id}) async {
    var path = '$AGENCIES_ENDPOINT/$id';
    var call = await _httpManager.get(path: path);

    return call;
  }
}

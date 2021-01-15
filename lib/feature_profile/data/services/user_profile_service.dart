import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_profile/data/services/remote_service.dart';

class UserProfileRemoteService with RemoteService {
  static const String PROFILE = '/user/profile';

  final HttpManager _httpManager;

  UserProfileRemoteService(this._httpManager);

  @override
  Future fetchProfile({String token}) {
    final Map<String, String> headers = {
      'Authorization': token,
    };
    return _httpManager.get(path: PROFILE, headers: headers);
  }
}

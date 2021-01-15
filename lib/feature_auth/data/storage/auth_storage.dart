import 'package:nepal_homes/feature_auth/data/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage with Storage {
  static const USER_KEY = 'user_key';

  final SharedPreferences _sharedPreferences;

  AuthStorage(this._sharedPreferences);

  @override
  Future loadUser() {
    return Future.value(_sharedPreferences.getString(USER_KEY));
  }

  @override
  Future saveUser({String userJson}) {
    return _sharedPreferences.setString(USER_KEY, userJson);
  }

  @override
  Future deleteUser() {
    return _sharedPreferences.remove(USER_KEY);
  }
}

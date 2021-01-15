import 'package:nepal_homes/core/exceptions/app_exceptions.dart';
import 'package:nepal_homes/feature_auth/data/datasources/local/local_data_source.dart';
import 'package:nepal_homes/feature_auth/data/models/authenticated_user_model.dart';
import 'package:nepal_homes/feature_auth/data/storage/storage.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';

class AuthLocalDataSource with LocalDataSource {
  final Storage _storage;

  AuthLocalDataSource(this._storage);

  @override
  Future<AuthenticatedUserModel> loadUser() async {
    try {
      final response = await _storage.loadUser();
      return AuthenticatedUserModel.fromJson(response);
    } catch (e) {
      throw UnAuthenticatedException();
    }
  }

  @override
  Future saveUser({AuthenticatedUserEntity userEntity}) {
    return _storage.saveUser(userJson: userEntity.toJson());
  }

  @override
  Future deleteUser() {
    return _storage.deleteUser();
  }
}

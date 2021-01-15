import 'package:nepal_homes/feature_auth/data/models/authenticated_user_model.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';

mixin LocalDataSource {
  Future<AuthenticatedUserModel> loadUser();

  Future saveUser({AuthenticatedUserEntity userEntity});

  Future deleteUser();
}

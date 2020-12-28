import 'package:scoped_model/scoped_model.dart';

import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';

class UserUIModel extends Model {
  UserEntity _userEntity;
  UserUIModel(
    this._userEntity,
  );

  set entity(UserEntity userEntity) {
    this._userEntity = userEntity;
    notifyListeners();
  }

  UserEntity get entity => this._userEntity;
}

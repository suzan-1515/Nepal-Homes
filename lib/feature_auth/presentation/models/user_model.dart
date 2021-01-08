import 'package:nepal_homes/feature_auth/domain/entities/user_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class UserUIModel extends Model {
  UserEntity _userEntity;

  UserUIModel(this._userEntity, s);

  set entity(UserEntity userEntity) {
    this._userEntity = userEntity;
    notifyListeners();
  }

  UserEntity get entity => this._userEntity;
}

import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class UserUIModel extends Model {
  AuthenticatedUserEntity _userEntity;

  UserUIModel(this._userEntity, s);

  set entity(AuthenticatedUserEntity userEntity) {
    this._userEntity = userEntity;
    notifyListeners();
  }

  AuthenticatedUserEntity get entity => this._userEntity;
}

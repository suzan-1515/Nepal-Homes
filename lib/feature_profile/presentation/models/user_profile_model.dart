import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class UserProfileUIModel extends Model {
  UserProfileEntity _userEntity;

  UserProfileUIModel(this._userEntity);

  set entity(UserProfileEntity userEntity) {
    this._userEntity = userEntity;
    notifyListeners();
  }

  UserProfileEntity get entity => this._userEntity;
}

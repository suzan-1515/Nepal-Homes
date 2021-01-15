import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';

mixin Repository {
  Future<AuthenticatedUserEntity> loginWithGoogle();

  Future<AuthenticatedUserEntity> loginWithFacebook();

  Future<AuthenticatedUserEntity> loginWithEmail(
      {@required String email, @required String password});

  Future<AuthenticatedUserEntity> signUpWithEmail(
      {@required UserSignUpEntity userSignUpPayload});

  Future<AuthenticatedUserEntity> autoLogin();

  Future<void> logout({@required AuthenticatedUserEntity userEntity});
}

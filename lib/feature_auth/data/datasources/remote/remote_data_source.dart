import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_auth/data/models/authenticated_user_model.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';

mixin RemoteDataSource {
  Future<AuthenticatedUserModel> loginWithGoogle();

  Future<AuthenticatedUserModel> loginWithFacebook();

  Future<void> logout({@required String token});

  Future<AuthenticatedUserModel> signup(
      {@required UserSignUpEntity signUpPayload});

  Future<AuthenticatedUserModel> loginWithEmail(
      {@required String email, @required String password});
}

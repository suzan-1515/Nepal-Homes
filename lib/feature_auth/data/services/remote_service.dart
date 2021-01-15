import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';

mixin RemoteService {
  Future<dynamic> loginWithGoogle();

  Future<dynamic> loginWithFacebook();

  Future<dynamic> logout({@required String token});

  Future<dynamic> signup({@required UserSignUpEntity signUpPayload});

  Future<dynamic> loginWithEmail(
      {@required String email, @required String password});
}

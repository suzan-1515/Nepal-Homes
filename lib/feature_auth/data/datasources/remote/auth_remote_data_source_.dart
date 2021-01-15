import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_auth/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_auth/data/models/authenticated_user_model.dart';
import 'package:nepal_homes/feature_auth/data/services/remote_service.dart';
import 'package:nepal_homes/feature_auth/domain/entities/auth_provider.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';

class AuthRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  AuthRemoteDataSource(this._remoteService);

  @override
  Future<AuthenticatedUserModel> loginWithEmail(
      {@required String email, @required String password}) async {
    var response =
        await _remoteService.loginWithEmail(email: email, password: password);
    return AuthenticatedUserModel.fromMap(response);
  }

  @override
  Future<AuthenticatedUserModel> signup(
      {@required UserSignUpEntity signUpPayload}) async {
    var response = await _remoteService.signup(signUpPayload: signUpPayload);
    return AuthenticatedUserModel.fromMap(response);
  }

  @override
  Future<AuthenticatedUserModel> loginWithFacebook() async {
    var response = await _remoteService.loginWithFacebook();
    response['provider'] = AuthProvider.FACEBOOK.toString();
    return AuthenticatedUserModel.fromMap(response);
  }

  @override
  Future<AuthenticatedUserModel> loginWithGoogle() async {
    var response = await _remoteService.loginWithGoogle();
    response['provider'] = AuthProvider.GOOGLE.toString();
    return AuthenticatedUserModel.fromMap(response);
  }

  @override
  Future<void> logout({@required String token}) {
    return _remoteService.logout(token: token);
  }
}

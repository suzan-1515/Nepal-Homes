import 'package:flutter/foundation.dart';
import 'package:nepal_homes/core/exceptions/app_exceptions.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_auth/data/datasources/local/local_data_source.dart';
import 'package:nepal_homes/feature_auth/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_auth/domain/entities/auth_provider.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';
import 'package:nepal_homes/feature_auth/domain/repositories/repository.dart';

class AuthRepository with Repository {
  final RemoteDataSource _authRemoteDataSource;
  final LocalDataSource _authLocalDataSource;
  final AnalyticsService _analyticsService;

  AuthRepository(this._authRemoteDataSource, this._analyticsService,
      this._authLocalDataSource);

  @override
  Future<AuthenticatedUserEntity> loginWithFacebook() {
    return _authRemoteDataSource.loginWithFacebook().then((value) async {
      await _authLocalDataSource.saveUser(userEntity: value);
      _analyticsService.logLogin(method: value.provider.toString());
      return value;
    });
  }

  @override
  Future<AuthenticatedUserEntity> loginWithGoogle() {
    return _authRemoteDataSource.loginWithGoogle().then((value) async {
      await _authLocalDataSource.saveUser(userEntity: value);
      _analyticsService.logLogin(method: value.toString());
      return value;
    });
  }

  @override
  Future<void> logout({@required AuthenticatedUserEntity userEntity}) {
    return _authRemoteDataSource
        .logout(token: userEntity.token)
        .then((value) async {
      await _authLocalDataSource.deleteUser();
      _analyticsService.logLogout();
      return value;
    });
  }

  @override
  Future<AuthenticatedUserEntity> autoLogin() async {
    final userEntity = await _authLocalDataSource.loadUser();
    switch (userEntity.provider) {
      case AuthProvider.GOOGLE:
        return loginWithGoogle();
      case AuthProvider.FACEBOOK:
        return loginWithFacebook();
      case AuthProvider.EMAIL:
        return loginWithEmail();
    }

    throw UnAuthenticatedException();
  }

  @override
  Future<AuthenticatedUserEntity> loginWithEmail(
      {String email, String password}) {
    return _authRemoteDataSource
        .loginWithEmail(email: email, password: password)
        .then((value) async {
      await _authLocalDataSource.saveUser(userEntity: value);
      _analyticsService.logLogin(method: value.toString());
      return value;
    });
  }

  @override
  Future<AuthenticatedUserEntity> signUpWithEmail(
      {UserSignUpEntity userSignUpPayload}) {
    return _authRemoteDataSource
        .signup(signUpPayload: userSignUpPayload)
        .then((value) async {
      await _authLocalDataSource.saveUser(userEntity: value);
      _analyticsService.logSignUp(method: value.toString());
      return value;
    });
  }
}

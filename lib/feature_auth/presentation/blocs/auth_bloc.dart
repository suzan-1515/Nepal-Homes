import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/core/usecases/usecase.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_auth/domain/usecases/logout_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UseCase _loginWithGoogleUseCase;
  UseCase _loginWithFacebookUseCase;
  UseCase _autoLoginUseCase;
  UseCase _logoutUseCase;

  AuthBloc({
    @required UseCase loginWithGoogleUseCase,
    @required UseCase autoLoginUseCase,
    @required UseCase loginWithFacebookUseCase,
    @required UseCase logoutUseCase,
  })  : _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _loginWithFacebookUseCase = loginWithFacebookUseCase,
        _autoLoginUseCase = autoLoginUseCase,
        _logoutUseCase = logoutUseCase,
        super(AuthInitialState());

  AuthenticatedUserEntity _currentUser;

  AuthenticatedUserEntity get currentUser => _currentUser;

  bool get isLoggedIn => currentUser != null;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AutoLoginEvent) {
      yield* _mapAutoLoginEventToState(event);
    } else if (event is LoginWithGoogleEvent) {
      yield* _mapLoginWithGoogleEventToState(event);
    } else if (event is LoginWithFacebookEvent) {
      yield* _mapLoginWithFacebookEventToState(event);
    } else if (event is LogoutEvent) {
      yield* _mapLogoutEventToState(event);
    }
  }

  Stream<AuthState> _mapAutoLoginEventToState(
    AutoLoginEvent event,
  ) async* {
    if (state is AuthLoadingState) return;
    yield AuthLoadingState();
    try {
      this._currentUser = await _autoLoginUseCase.call(NoParams());
      if (this._currentUser == null)
        yield AuthErrorState(message: 'Unable to login.');
      _injectUser(this._currentUser);
      yield AuthSuccessState(this._currentUser);
    } catch (e) {
      log('Error auto login: ', error: e);
      yield AuthErrorState(message: 'Unable to login.');
    }
  }

  Stream<AuthState> _mapLoginWithGoogleEventToState(
    LoginWithGoogleEvent event,
  ) async* {
    if (state is AuthLoadingState) return;
    yield AuthLoadingState();
    try {
      this._currentUser = await _loginWithGoogleUseCase.call(NoParams());
      if (this._currentUser == null)
        yield AuthErrorState(message: 'Unable to login.');
      _injectUser(this._currentUser);
      yield AuthSuccessState(this._currentUser);
    } catch (e) {
      log('Error login with google: ', error: e);
      yield AuthErrorState(message: 'Unable to login.');
    }
  }

  Stream<AuthState> _mapLoginWithFacebookEventToState(
    LoginWithFacebookEvent event,
  ) async* {
    if (state is AuthLoadingState) return;
    yield AuthLoadingState();
    try {
      this._currentUser = await _loginWithFacebookUseCase.call(NoParams());
      if (this._currentUser == null)
        yield AuthErrorState(message: 'Unable to login.');
      _injectUser(this._currentUser);
      yield AuthSuccessState(this._currentUser);
    } catch (e) {
      log('Error login with facebook: ', error: e);
      yield AuthErrorState(message: 'Unable to login.');
    }
  }

  Stream<AuthState> _mapLogoutEventToState(
    LogoutEvent event,
  ) async* {
    try {
      await _logoutUseCase.call(LogoutUseCaseParams(userEntity: currentUser));
      this._currentUser = null;
      GetIt.I.unregister<AuthenticatedUserEntity>();
      yield AuthLogoutState(message: 'Logged Out!');
    } catch (e) {
      log('Error logout : ', error: e);
      yield AuthErrorState(message: 'Unable to logout.');
    }
  }

  _injectUser(AuthenticatedUserEntity user) {
    if (GetIt.I.isRegistered<AuthenticatedUserEntity>())
      GetIt.I.unregister<AuthenticatedUserEntity>();
    GetIt.I.registerSingleton<AuthenticatedUserEntity>(user);
  }
}

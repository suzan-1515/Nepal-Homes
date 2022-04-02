import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_auth/data/services/remote_service.dart';
import 'package:nepal_homes/feature_auth/domain/entities/user_signup_entity.dart';

class AuthRemoteService with RemoteService {
  static const String REGISTER = '/user/register';
  static const String GOOGLE_LOGIN = '/user/login/google';
  static const String FACEBOOK_LOGIN = '/user/login/facebook';
  static const String EMAIL_LOGIN = '/user/login';
  static const String LOGOUT = '/user/logout';

  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final HttpManager _httpManager;

  AuthRemoteService(this._googleSignIn, this._facebookAuth, this._httpManager);

  @override
  Future loginWithFacebook() async {
    final LoginResult loginResult = await _facebookAuth.login(
        loginBehavior: LoginBehavior.nativeWithFallback);

    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken.token);

    final Map<String, String> body = {
      'access_token': facebookAuthCredential.accessToken
    };

    return _httpManager.post(path: FACEBOOK_LOGIN, body: body);
  }

  @override
  Future loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final Map<String, String> body = {'access_token': credential.accessToken};

    return _httpManager.post(path: GOOGLE_LOGIN, body: body);
  }

  @override
  Future signup({@required UserSignUpEntity signUpPayload}) {
    final Map<String, String> body = {
      "email": signUpPayload.email,
      "mobile_no": signUpPayload.mobileNo,
      "name": signUpPayload.name,
      "password": signUpPayload.password,
    };
    return _httpManager.post(path: REGISTER, body: body);
  }

  @override
  Future loginWithEmail({String email, String password}) {
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };
    return _httpManager.post(path: EMAIL_LOGIN, body: body);
  }

  @override
  Future logout({@required String token}) {
    final Map<String, String> headers = {
      'Authorization': token,
    };
    return _httpManager.get(path: LOGOUT, headers: headers);
  }
}

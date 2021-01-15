import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_auth/presentation/blocs/auth_bloc.dart';
import 'package:nepal_homes/feature_main/presentation/ui/main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/login';

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInUp(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/icons/logo.png')),
            ),
          ),
        ),
        SizedBox(height: 16),
        Flexible(
            child: FadeInUp(
          child: Text(
            'Create an account to have full access',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        )),
      ],
    );
  }

  Widget _buildSignInButtons(BuildContext context) {
    return FadeInLeft(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SignInButton(
              Buttons.Google,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
                right: Radius.circular(16),
              )),
              text: 'Continue with Google',
              onPressed: () {
                context.read<AuthBloc>().add(LoginWithGoogleEvent());
              },
            ),
            SizedBox(height: 8),
            SignInButton(
              Buttons.Facebook,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
                right: Radius.circular(16),
              )),
              text: 'Continue with Facebook',
              onPressed: () {
                context.read<AuthBloc>().add(LoginWithFacebookEvent());
              },
            ),
            SizedBox(height: 8),
            OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
                right: Radius.circular(16),
              )),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.ROUTE_NAME, (route) => false);
              },
              child: Text('Continue as Guest'),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrorState) {
                context.showMessage(state.message);
              } else if (state is AuthSuccessState) {
                GetIt.I
                    .get<CrashAnalyticsService>()
                    .setUser(userId: state.user.user.id);
                GetIt.I
                    .get<NotificationService>()
                    .setEmail(state.user.user.email);
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.ROUTE_NAME, (route) => false);
              }
            },
            buildWhen: (previous, current) => !(current is AuthSuccessState),
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is AuthLoadingState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: _buildHeader(context),
                    ),
                    SizedBox(height: 16),
                    if (state is AuthLoadingState)
                      Center(child: ProgressView()),
                    Expanded(
                      child: _buildSignInButtons(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

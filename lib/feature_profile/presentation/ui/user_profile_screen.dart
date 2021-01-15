import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_auth/presentation/blocs/auth_bloc.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/presentation/cubits/user_profile_cubit.dart';
import 'package:nepal_homes/feature_profile/utils/providers.dart';

class UserProfileScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/profile';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Widget _buildImage(BuildContext context, UserProfileEntity user) {
    return Hero(
      tag: 'profile_pic_tag',
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).cardColor,
          image: DecorationImage(
              image: (user.image?.fullPath?.isNotEmpty ?? false)
                  ? CachedNetworkImageProvider(user.image?.fullPath)
                  : AssetImage('assets/images/user.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context, UserProfileEntity user) {
    return Text(
      user.name,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildLogoutButton(BuildContext context, UserProfileEntity user) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutState) {
          Navigator.pop(context);
          context.showMessage(state.message);
        }
      },
      child: IgnorePointer(
        ignoring: false,
        child: OutlineButton(
          padding: const EdgeInsets.all(8),
          onPressed: () => context.read<AuthBloc>().add(LogoutEvent()),
          child: Text('Log out'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return UserProfileProviders.userProfileBlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) =>
                  BlocConsumer<UserProfileCubit, UserProfileState>(
                      listener: (context, state) {
                if (state is UserProfileLoadError) {
                  context.showMessage(state.message);
                }
              }, builder: (context, state) {
                if (state is UserProfileLoadSuccess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: _buildImage(context, state.user),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: _buildName(context, state.user),
                      ),
                      SizedBox(height: 32),
                      _buildLogoutButton(context, state.user),
                      SizedBox(height: 16),
                    ],
                  );
                } else if (state is UserProfileLoadError) {
                  return Center(
                      child: ErrorDataView(
                    message: state.message,
                    onRetry: () =>
                        context.read<UserProfileCubit>().getProfile(),
                  ));
                }

                return Center(child: ProgressView());
              }),
            ),
          ),
        ),
      ),
    );
  }
}

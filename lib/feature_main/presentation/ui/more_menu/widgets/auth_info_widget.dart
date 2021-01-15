import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_auth/presentation/ui/login_screen.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/presentation/ui/user_profile_screen.dart';
import 'package:nepal_homes/feature_profile/utils/providers.dart';

class AuthInfo extends StatefulWidget {
  @override
  _AuthInfoState createState() => _AuthInfoState();
}

class _AuthInfoState extends State<AuthInfo> {
  Widget _buildUserInfo(BuildContext context, UserProfileEntity user) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UserProfileScreen.ROUTE_NAME);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
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
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            child: Text(
              user.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButtons(BuildContext context, UserProfileEntity user) {
    return Align(
      alignment: Alignment.center,
      child: OutlineButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
        },
        child: Text('Sign In'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserProfileProviders.userProfileBlocProvider(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            final user = null;
            if (user != null) {
              return _buildUserInfo(context, null);
            }
            return _buildSignInButtons(context, null);
          },
        ),
      ),
    );
  }
}

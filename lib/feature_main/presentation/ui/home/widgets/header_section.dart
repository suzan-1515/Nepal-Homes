import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/utils/date_time_utils.dart';
import 'package:nepal_homes/feature_auth/presentation/blocs/auth_bloc.dart';
import 'package:nepal_homes/feature_auth/presentation/ui/login_screen.dart';
import 'package:nepal_homes/feature_auth/presentation/ui/user_profile_screen.dart';
import 'package:nepali_utils/nepali_utils.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // ignore: close_sinks
    final authBloc = context.watch<AuthBloc>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_banner.jpg'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Find Your Dream Home',
            style: theme.textTheme.headline6.copyWith(
                color: theme.accentColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Text(
            NepaliDateFormat("yyyy MMMM d, EEE").format(NepaliDateTime.now()),
            style: theme.textTheme.subtitle2,
          ),
          const SizedBox(height: 4.0),
          Text(
            'Good ${timeContextGreeting()},',
            style:
                theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          GestureDetector(
            onTap: () => authBloc.isLoggedIn
                ? Navigator.pushNamed(context, UserProfileScreen.ROUTE_NAME)
                : Navigator.pushNamed(context, LoginScreen.ROUTE_NAME),
            child: Text(
              '${authBloc.isLoggedIn ? authBloc.currentUser.fullname ?? 'Stranger' : 'Stranger'}',
              style: theme.textTheme.subtitle1
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}

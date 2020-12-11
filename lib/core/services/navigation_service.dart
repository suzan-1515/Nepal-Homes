import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/agency_detail_screen.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/agency_list_screen.dart';
import 'package:nepal_homes/feature_auth/presentation/ui/login_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/main/main_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/splash/splash_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';

class NavigationService {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
      case MainScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => MainScreen(), settings: settings);
      case LoginScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case AgencyListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => AgencyListScreen(), settings: settings);
      case AgencyDetailScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => AgencyDetailScreen(), settings: settings);
      case PropertyDetailScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => PropertyDetailScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),
            settings: settings);
    }
  }
}

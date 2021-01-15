import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/gallery_view_screen.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/agency_detail_screen.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/agency_list_screen.dart';
import 'package:nepal_homes/feature_auth/presentation/ui/login_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/main/main_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/splash/splash_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/author_news_list/author_news_list_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/category_news_list/category_news_list_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_list/news_list_screen.dart';
import 'package:nepal_homes/feature_profile/presentation/ui/user_profile_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/all/property_list_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/featured/featured_property_list_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/hot/hot_property_list_screen.dart';

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
      case UserProfileScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => UserProfileScreen(), settings: settings);
      case AgencyListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => AgencyListScreen(), settings: settings);
      case AgencyDetailScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => AgencyDetailScreen(), settings: settings);
      case PropertyDetailScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => PropertyDetailScreen(), settings: settings);
      case HotPropertyListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => HotPropertyListScreen(), settings: settings);
      case FeaturedPropertyListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => FeaturedPropertyListScreen(), settings: settings);
      case PropertyListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => PropertyListScreen(), settings: settings);
      case GalleryViewScreen.ROUTE:
        return MaterialPageRoute(
            builder: (_) => GalleryViewScreen(), settings: settings);
      case NewsListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => NewsListScreen(), settings: settings);
      case NewsDetailScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => NewsDetailScreen(), settings: settings);
      case CategoryNewsListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => CategoryNewsListScreen(), settings: settings);
      case AuthorNewsListScreen.ROUTE_NAME:
        return MaterialPageRoute(
            builder: (_) => AuthorNewsListScreen(), settings: settings);
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

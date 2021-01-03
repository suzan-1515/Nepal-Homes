import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/core/widgets/fab_bottom_app_bar.dart';
import 'package:nepal_homes/feature_main/presentation/blocs/main/main_cubit.dart';
import 'package:nepal_homes/feature_main/presentation/ui/home/home_view.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/more_menu_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_list/news_list_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/all/property_list_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/all/property_list_view.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/saved/saved_property_screen.dart';

class MainScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StreamSubscription _dynamicLinkSubscription;
  final _pageController = PageController();
  final mainCubit = MainCubit();

  @override
  void initState() {
    super.initState();
    _initDynamicLinks();
  }

  _initDynamicLinks() {
    _dynamicLinkSubscription =
        GetIt.I.get<DynamicLinkService>().linkStream.listen((event) {
      log('[MainScreen] dynamic link received: ${event.path}');
      if (event.path == PropertyListScreen.ROUTE_NAME) {
        Navigator.pushNamed(context, PropertyListScreen.ROUTE_NAME,
            arguments: PropertyListScreenArgs.fromMap(event.queryParameters));
      } else if (PropertyDetailScreen.ROUTE_NAME
              .contains(event.pathSegments.first) &&
          event.pathSegments.length == 2) {
        Navigator.pushNamed(
          context,
          PropertyDetailScreen.ROUTE_NAME,
          arguments: PropertyDetailScreenArgs(event.pathSegments.last),
        );
      } else if (NewsListScreen.ROUTE_NAME == event.path) {
        Navigator.pushNamed(
          context,
          NewsListScreen.ROUTE_NAME,
        );
      } else if (NewsDetailScreen.ROUTE_NAME
              .contains(event.pathSegments.first) &&
          event.pathSegments.length == 2) {
        Navigator.pushNamed(
          context,
          NewsDetailScreen.ROUTE_NAME,
          arguments: NewsDetailScreenArgs(
            event.pathSegments.last,
            title: event.hasQuery ? event.queryParameters['title'] : null,
          ),
        );
      }
    }, onError: (e) {
      log('[MainScreen] already subscribed');
    }, cancelOnError: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainCubit,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Center(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                const HomeView(),
                const PropertyListView(),
                const SavedPropertyListView(),
                const MoreMenuView(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(LineAwesomeIcons.plus_circle),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            if (state is MainNavItemSelectionChangedState) {
              this._pageController.jumpToPage(state.currentIndex);
            }
          },
          builder: (context, state) => FABBottomAppBar(
            selectedColor: Theme.of(context).primaryColor,
            notchedShape: CircularNotchedRectangle(),
            notchMargin: 6.0,
            currentIndex: state.currentIndex,
            onTabSelected: (value) {
              context.read<MainCubit>().navItemSelected(value);
            },
            items: [
              FABBottomAppBarItem(
                iconData: LineAwesomeIcons.home,
                text: 'Home',
              ),
              FABBottomAppBarItem(
                iconData: LineAwesomeIcons.compass,
                text: 'Property',
              ),
              FABBottomAppBarItem(
                iconData: LineAwesomeIcons.heart,
                text: 'Saved',
              ),
              FABBottomAppBarItem(
                iconData: LineAwesomeIcons.th_large,
                text: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _dynamicLinkSubscription?.cancel();
    mainCubit?.close();
    super.dispose();
  }
}

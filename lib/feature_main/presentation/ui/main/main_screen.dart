import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_main/presentation/blocs/main/main_cubit.dart';
import 'package:nepal_homes/feature_main/presentation/ui/home/home_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/more_menu_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/property_list_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/saved/saved_property_screen.dart';

class MainScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController();
  StreamSubscription _dynamicLinkSubscription;

  @override
  void initState() {
    super.initState();
    _initDynamicLinks();
  }

  _initDynamicLinks() {
    _dynamicLinkSubscription =
        GetIt.I.get<DynamicLinkService>().linkStream.listen((event) {
      log('[MainScreen] dynamic link received: ${event.path}');
      if (event.pathSegments.first == 'horoscope') {
        log('[MainScreen] Navigate to horocope screen');
      } else if (event.pathSegments.first == 'forex') {
        log('[MainScreen] Navigate to forex screen');
      } else if (event.pathSegments.first == 'gold-silver') {
        log('[MainScreen] Navigate to gold-silver screen');
      } else if (event.pathSegments.first == 'news-detail') {
        log('[MainScreen] Navigate to news detail screen');
      }
    }, onError: (e) {
      log('[MainScreen] already subscribed');
    }, cancelOnError: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Center(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => {},
              children: <Widget>[
                HomeScreen(),
                PropertyListScreen(),
                SavedPropertyListScreen(),
                MoreMenuScreen(),
              ],
              physics: NeverScrollableScrollPhysics(),
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
          builder: (context, state) => BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Theme.of(context).indicatorColor,
            backgroundColor: Theme.of(context).backgroundColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.compass),
                label: 'Property',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.heart),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.th_large),
                label: 'More',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<MainCubit>().navItemSelected(index);
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _dynamicLinkSubscription?.cancel();
    super.dispose();
  }
}

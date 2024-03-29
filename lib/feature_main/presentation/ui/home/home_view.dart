import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/widgets/agencies_section.dart';
import 'package:nepal_homes/feature_main/presentation/ui/home/widgets/loan_process_section.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/recent_news_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/featured_properties_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/hot_properties_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_categories_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/recent_properties_section.dart';

import 'widgets/header_section.dart';
import 'widgets/post_property_section.dart';
import 'widgets/request_property_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderSection(),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const PropertyCategoriesSection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const HotPropertySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const FeaturedPropertySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const RecentPropertySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const PostPropertySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const LoanProcessSection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const RequestPropertySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const AgencySection(),
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: const RecentNewsSection(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_main/presentation/ui/home/widgets/loan_process_section.dart';

import 'widgets/agencies_section.dart';
import 'widgets/explore_section.dart';
import 'widgets/featured_properties_section.dart';
import 'widgets/header_section.dart';
import 'widgets/hot_properties_section.dart';
import 'widgets/post_property_section.dart';
import 'widgets/recent_news_section.dart';
import 'widgets/recent_properties_section.dart';
import 'widgets/request_property_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          // physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: const HeaderSection(),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const ExploreSection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const HotPropertySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const FeaturedPropertySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const RecentPropertySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const PostPropertySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const LoanProcessSection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const RequestPropertySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const AgencySection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: const RecentNewsSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

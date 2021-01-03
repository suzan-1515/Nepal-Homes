import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/agency_list_screen.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/widgets/more_menu_list_item.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_list/news_list_screen.dart';

class ExploreMenuList extends StatelessWidget {
  const ExploreMenuList({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MoreMenuListItem(
          title: 'Home Loan',
          icon: LineAwesomeIcons.hand_holding_us_dollar,
          onTap: () => {},
        ),
        Divider(),
        MoreMenuListItem(
          title: 'Request Property',
          icon: LineAwesomeIcons.campground,
          onTap: () => {},
        ),
        Divider(),
        MoreMenuListItem(
          title: 'Blogs',
          icon: LineAwesomeIcons.blog,
          onTap: () => Navigator.pushNamed(context, NewsListScreen.ROUTE_NAME),
        ),
        Divider(),
        MoreMenuListItem(
          title: 'Agencies',
          icon: LineAwesomeIcons.certificate,
          onTap: () {
            Navigator.pushNamed(context, AgencyListScreen.ROUTE_NAME);
          },
        ),
      ],
    );
  }
}

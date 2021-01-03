import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/widgets/auth_info_widget.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/widgets/explore_menu_list.dart';

class MoreMenuView extends StatefulWidget {
  static const String ROUTE_NAME = '/more-menu';

  const MoreMenuView({Key key});

  @override
  _MoreMenuViewState createState() => _MoreMenuViewState();
}

class _MoreMenuViewState extends State<MoreMenuView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 8),
          AuthInfo(),
          Divider(
            thickness: 1,
          ),
          SizedBox(height: 8),
          Text(
            'EXPLORE',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: 8),
          ExploreMenuList(context: context),
          SizedBox(height: 8),
          Text(
            'TOOLS',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

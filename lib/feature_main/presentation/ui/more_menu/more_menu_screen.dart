import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/widgets/auth_info_widget.dart';
import 'package:nepal_homes/feature_main/presentation/ui/more_menu/widgets/explore_menu_list.dart';

class MoreMenuScreen extends StatefulWidget {
  @override
  _MoreMenuScreenState createState() => _MoreMenuScreenState();
}

class _MoreMenuScreenState extends State<MoreMenuScreen>
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
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 8),
          AuthInfo(),
          Divider(
            thickness: 4,
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

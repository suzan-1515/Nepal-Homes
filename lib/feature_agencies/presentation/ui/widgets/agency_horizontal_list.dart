import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/agency_detail_screen.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/widgets/agency_grid_view_item.dart';
import 'package:sizer/sizer.dart';

class AgencyHorizontalList extends StatelessWidget {
  final List<AgencyUIModel> properties;

  const AgencyHorizontalList({Key key, @required this.properties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    return AlignedGridView.count(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final e = properties[index].entity;
        return AgencyGridViewItem(
          onTap: () => Navigator.pushNamed(
            context,
            AgencyDetailScreen.ROUTE_NAME,
            arguments: AgencyDetailScreenArgs(e.id),
          ),
          image: e.logo?.fullPath,
          propertyCount: e.productCount,
          title: e.title,
        );
      },
    );
  }
}

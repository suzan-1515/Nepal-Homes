import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/widgets/agency_list_view_item.dart';

class PropertyList extends StatelessWidget {
  const PropertyList();
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          Placeholder(
            fallbackHeight: 100,
          ),
          SizedBox(
            height: 8.0,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
          SizedBox(
            height: 8.0,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
          SizedBox(
            height: 8.0,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
        ],
      ),
    );
  }
}

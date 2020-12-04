import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/location_filter_item.dart';

import 'filter_section_header.dart';

class PropertyLocationFilter extends StatelessWidget {
  final FilterUIModel filter;
  static const locationData = [
    'Location 1',
    'Location 2',
    'Location 3',
    'Location 4',
    'Location 5'
  ];

  const PropertyLocationFilter({
    Key key,
    @required this.filter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterSectionHeader(title: 'Location'),
        SizedBox(
          height: 8.0,
        ),
        LocationFilterItem(data: locationData, value: 'Location 3'),
      ],
    );
  }
}

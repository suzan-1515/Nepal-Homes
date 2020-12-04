import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_type_filter_item.dart';

import 'filter_section_header.dart';

class PropertyTypeFilter extends StatelessWidget {
  final FilterUIModel filter;
  static const data = ['Commercial', 'Residential'];

  const PropertyTypeFilter({
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
        FilterSectionHeader(title: 'Property Type'),
        TypeFilterItem(
          data: data,
          selected: 'Commercial',
        ),
      ],
    );
  }
}

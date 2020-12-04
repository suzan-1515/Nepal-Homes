import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/premium_filter_item.dart';

import 'filter_section_header.dart';

class PropertyPremiumFeaturedFilter extends StatelessWidget {
  final FilterUIModel filter;

  const PropertyPremiumFeaturedFilter({
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
        FilterSectionHeader(title: 'Premium / Featured'),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: PremiumFilterItem(
                title: 'Premuim',
                value: false,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: PremiumFilterItem(
                title: 'Featured',
                value: false,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

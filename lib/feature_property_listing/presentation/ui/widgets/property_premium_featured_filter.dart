import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
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
                value: filter.entity.isPremium ?? false,
                onChanged: (value) => filter.entity = filter.entity
                    .copyWith(isPremium: Nullable<bool>(value ? value : null)),
              ),
            ),
            Expanded(
              child: PremiumFilterItem(
                title: 'Featured',
                value: filter.entity.isFeatured ?? false,
                onChanged: (value) => filter.entity = filter.entity
                    .copyWith(isFeatured: Nullable<bool>(value ? value : null)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

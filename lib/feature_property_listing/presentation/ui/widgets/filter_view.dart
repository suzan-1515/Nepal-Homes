import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_category_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_location_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_premium_featured_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_price_range_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_purpose_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_road_type_filter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_type_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = ScopedModel.of<FilterUIModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PropertyPurposeFilter(filter: filter),
            SizedBox(height: 16),
            PropertyPremiumFeaturedFilter(filter: filter),
            SizedBox(height: 16),
            PropertyCategoryFilter(filter: filter),
            SizedBox(height: 16),
            PropertyTypeFilter(filter: filter),
            SizedBox(height: 16),
            PropertyPriceRangeFilter(filter: filter),
            SizedBox(height: 16),
            PropertyLocationFilter(filter: filter),
            SizedBox(height: 16),
            PropertyRoadTypeFilter(filter: filter),
          ],
        ),
      ),
    );
  }
}

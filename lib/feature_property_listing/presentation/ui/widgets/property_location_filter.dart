import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/location_filter_item.dart';

import 'filter_section_header.dart';

class PropertyLocationFilter extends StatelessWidget {
  final FilterUIModel filter;

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
        LocationFilterItem(
          data: filter.entity.propertyMeta.location.states
                  .map<Location>((e) => e)
                  .toList() +
              filter.entity.propertyMeta.location.districts
                  .map<Location>((e) => e)
                  .toList() +
              filter.entity.propertyMeta.location.municipalities
                  .map<Location>((e) => e)
                  .toList() +
              filter.entity.propertyMeta.location.areas
                  .map<Location>((e) => e)
                  .toList(),
          value: filter.entity.location,
          onChanged: (value) => filter.entity =
              filter.entity.copyWith(location: Nullable<Location>(value)),
          onClear: () => filter.entity =
              filter.entity.copyWith(location: Nullable<Location>(null)),
        ),
      ],
    );
  }
}

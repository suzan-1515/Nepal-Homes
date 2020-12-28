import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/amenity_item.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';

class Amenities extends StatelessWidget {
  const Amenities();

  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
    return BorderedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(title: 'Amenities'),
          SizedBox(height: 16),
          Wrap(
            direction: Axis.horizontal,
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              ...property.entity.building?.amenities
                  ?.map<Widget>((e) => AmenityItem(
                      icon: e.media?.fullPath ?? '', title: e.title))
                  ?.toList(),
            ],
          ),
        ],
      ),
    );
  }
}

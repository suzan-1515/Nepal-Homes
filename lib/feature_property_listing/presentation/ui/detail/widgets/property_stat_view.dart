import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_stat_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyStatView extends StatelessWidget {
  const PropertyStatView();
  List<Widget> _buildStatRowItems(PropertyDetailEntity property) {
    final stats = <Widget>[];
    if (property.locationProperty.totalArea != null &&
        property.locationProperty.totalArea.isNotEmpty)
      stats.add(
        Expanded(
          child: Center(
            child: PropertyStatItem(
                icon: Icon(
                  LineAwesomeIcons.ruler_combined,
                  size: 18,
                  color: Color.fromARGB(255, 145, 152, 161),
                ),
                count: property.locationProperty.totalArea,
                title: 'Area'),
          ),
        ),
      );
    else if (property.building.noOf?.bedroom != null)
      stats.add(
        Expanded(
          child: Center(
            child: PropertyStatItem(
                icon: Icon(
                  LineAwesomeIcons.bed,
                  size: 18,
                  color: Color.fromARGB(255, 145, 152, 161),
                ),
                count: property.building.noOf.bedroom?.toString(),
                title: 'Beds'),
          ),
        ),
      );
    if (property.locationProperty.roadAccessValue != null &&
        property.locationProperty.roadAccessValue.isNotEmpty)
      stats.add(
        Expanded(
          child: Center(
            child: PropertyStatItem(
                icon: Icon(
                  LineAwesomeIcons.road,
                  size: 18,
                  color: Color.fromARGB(255, 145, 152, 161),
                ),
                count:
                    '${property.locationProperty.roadAccessValue} ${property.locationProperty.roadAccessLengthUnit.title}',
                title: 'Road'),
          ),
        ),
      );
    else if (property.building.noOf?.bathroom != null)
      stats.add(
        Expanded(
          child: Center(
            child: PropertyStatItem(
                icon: Icon(
                  LineAwesomeIcons.bed,
                  size: 18,
                  color: Color.fromARGB(255, 145, 152, 161),
                ),
                count: property.building.noOf.bathroom?.toString(),
                title: 'Bathroom'),
          ),
        ),
      );

    if (!property.basic.propertyCategory.isLand())
      stats.add(
        Expanded(
          child: Center(
            child: PropertyStatItem(
                icon: Icon(
                  LineAwesomeIcons.building,
                  size: 18,
                  color: Color.fromARGB(255, 145, 152, 161),
                ),
                count: property.building.totalFloor?.toString() ?? '0',
                title: 'Floor'),
          ),
        ),
      );

    return stats;
  }

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildStatRowItems(property.entity),
    );
  }
}

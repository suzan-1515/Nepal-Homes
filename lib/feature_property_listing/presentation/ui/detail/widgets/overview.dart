import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/overview_item.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';

class Overview extends StatelessWidget {
  const Overview();
  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    return FadeInUp(
      duration: const Duration(milliseconds: 200),
      child: BorderedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(title: 'Overview'),
            SizedBox(height: 16),
            Wrap(
              direction: Axis.horizontal,
              spacing: 16.0,
              runSpacing: 12.0,
              children: [
                OverviewItem(
                  icon: LineAwesomeIcons.key,
                  value:
                      '${property.entity.prefix}${property.entity.propertyId ?? 'N/A'}',
                  title: 'Property Id',
                ),
                OverviewItem(
                  icon: LineAwesomeIcons.compass,
                  value:
                      property.entity.locationProperty?.propertyFace?.title ??
                          'N/A',
                  title: 'Property Face',
                ),
                OverviewItem(
                  icon: LineAwesomeIcons.calendar_1,
                  value:
                      property.entity.basic?.propertyOwnership?.title ?? 'N/A',
                  title: 'Ownership Type',
                ),
                OverviewItem(
                  icon: LineAwesomeIcons.route,
                  value:
                      '${property.entity.locationProperty?.roadAccessValue ?? 'N/A'} ${property.entity.locationProperty?.roadAccessLengthUnit?.title ?? 'N/A'}',
                  title: 'Road Access',
                ),
                OverviewItem(
                  icon: LineAwesomeIcons.road,
                  value:
                      '${property.entity.locationProperty?.roadAccessRoadType?.title ?? 'N/A'}',
                  title: 'Road Type',
                ),
                OverviewItem(
                  icon: LineAwesomeIcons.area_chart,
                  value:
                      '${property.entity.locationProperty?.totalArea ?? 'N/A'} ${property.entity.locationProperty?.totalAreaUnit?.title ?? 'N/A'}',
                  title: 'Total Area',
                ),
                if (!property.entity.basic.propertyCategory.isLand()) ...[
                  Divider(),
                  OverviewItem(
                    icon: LineAwesomeIcons.road,
                    value: '${property.entity.building?.totalFloor ?? 'N/A'}',
                    title: 'Total Floor',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.utensils,
                    value:
                        '${property.entity.building?.noOf?.kitchen ?? 'N/A'}',
                    title: 'Kitchen',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.table,
                    value:
                        '${property.entity.building?.noOf?.dinningroom ?? 'N/A'}',
                    title: 'Dinning',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.bed,
                    value:
                        '${property.entity.building?.noOf?.bedroom ?? 'N/A'}',
                    title: 'Bedroom',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.bath,
                    value:
                        '${property.entity.building?.noOf?.bathroom ?? 'N/A'}',
                    title: 'Bathroom',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.dungeon,
                    value: '${property.entity.building?.noOf?.hall ?? 'N/A'}',
                    title: 'Hall',
                  ),
                  OverviewItem(
                    icon: LineAwesomeIcons.car,
                    value: (property.entity.building?.hasParking ?? false)
                        ? property.entity.building?.parking
                        : 'N/A',
                    title: 'Parking',
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

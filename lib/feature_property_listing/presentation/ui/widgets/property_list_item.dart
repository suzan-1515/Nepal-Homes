import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_stat_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyListItem extends StatelessWidget {
  final double coverHeight;

  const PropertyListItem({Key key, this.coverHeight = 120}) : super(key: key);

  List<Widget> _buildStatRowItems(PropertyEntity property) {
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
    final property =
        ScopedModel.of<PropertyUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          PropertyDetailScreen.ROUTE_NAME,
          arguments: PropertyDetailScreenArgs(property.entity.slugUrl),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: coverHeight,
              decoration: BoxDecoration(
                color: theme.highlightColor,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedImage(
                    (property.entity.media?.images == null ||
                            (property.entity.media?.images?.isEmpty ?? true))
                        ? APIUrlConstants.DEFAULT_IMAGE_URL
                        : property.entity.media.images.first.fullPath,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: RawMaterialButton(
                      padding: const EdgeInsets.all(0.0),
                      elevation: 2.0,
                      child: Icon(
                        LineAwesomeIcons.heart_1,
                        color: theme.backgroundColor,
                        size: 18,
                      ),
                      onPressed: () {},
                      constraints: BoxConstraints.tightFor(
                        width: 38.0,
                        height: 38.0,
                      ),
                      shape: CircleBorder(),
                      fillColor: theme.backgroundColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${property.entity.basic.propertyCategory.title.toUpperCase()} • ${property.entity.addedAt.momentAgo}',
                    maxLines: 2,
                    style: theme.textTheme.subtitle2
                        .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                  ),
                  const SizedBox(width: 8.0),
                  Chip(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.all(0.0),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: Color.fromARGB(255, 143, 216, 160),
                    label: Text(
                      '${property.entity.basic.propertyPurpose?.title?.toUpperCase() ?? 'N/A'}',
                    ),
                    labelStyle: Theme.of(context).textTheme.overline.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text:
                        '${(property.entity.price.isPriceOnCall ?? true) ? 'Price on Call' : property.entity.price.formattedValue()}',
                    style: theme.textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 57, 72)),
                    children: [
                      TextSpan(
                          text:
                              ' ${(property.entity.price.isPriceOnCall ?? true) ? '' : property.entity.price.label.title}',
                          style: theme.textTheme.caption),
                    ]),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: IconText(
                  label: Text(
                    '${property.entity.address.area.name}, ${property.entity.address.city.name}',
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                  ),
                  icon: Icon(
                    LineAwesomeIcons.map_marker,
                    size: 16,
                    color: Color.fromARGB(255, 145, 152, 161),
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildStatRowItems(property.entity),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

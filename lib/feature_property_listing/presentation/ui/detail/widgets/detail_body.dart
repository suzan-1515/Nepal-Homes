import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/amenities.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/description.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/listing_agent.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/overview.dart';
import 'package:scoped_model/scoped_model.dart';

import 'location_map.dart';

class DetailBody extends StatelessWidget {
  const DetailBody();
  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  '${property.entity.basic.propertyPurpose.title.toUpperCase()}',
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
          RichText(
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
          const SizedBox(height: 8.0),
          IconText(
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
          const SizedBox(
            height: 16.0,
          ),
          const Overview(),
          SizedBox(height: 8.0),
          const Description(),
          SizedBox(height: 8.0),
          const ListingAgent(),
          SizedBox(height: 8.0),
          if (!(property.entity.basic.propertyCategory?.isLand() ?? true)) ...[
            const Amenities(),
            SizedBox(height: 8.0),
          ],
          const LocationMap(),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

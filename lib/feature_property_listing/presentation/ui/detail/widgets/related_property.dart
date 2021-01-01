import 'package:flutter/material.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_grid_item.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

import '../property_detail_screen.dart';

class RelatedProperty extends StatelessWidget {
  const RelatedProperty();

  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    // final mediaQuery = MediaQuery.of(context);
    final crossAxisExtent =SizerUtil.orientation == Orientation.portrait? 80.0.w:40.0.w;
    final itemCoverHeight =
        SizerUtil.orientation == Orientation.portrait ? 20.0.w : 15.0.h;
    return BorderedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
              title: property.entity.isByAgency
                  ? 'Other Properties by ${property.entity.agency?.title}'
                  : 'Other Properties'),
          SizedBox(height: 16),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: property.relatedProperties
                  ?.map<Widget>((e) => SizedBox(
                        width: crossAxisExtent,
                        child: PropertyGridItem(
                          imageHeight: itemCoverHeight,
                          onTap: () => Navigator.pushNamed(
                            context,
                            PropertyDetailScreen.ROUTE_NAME,
                            arguments: PropertyDetailScreenArgs(e.slugUrl),
                          ),
                          momentAgo: e.addedAt.momentAgo,
                          image: (e.media?.images?.isEmpty ?? true)
                              ? null
                              : e.media?.images?.first?.fullPath,
                          category: e.basic.propertyCategory?.title,
                          purpose: e.basic.propertyPurpose?.title,
                          price:
                              '${(e.price.isPriceOnCall ?? true) ? 'Price on Call' : e.price.formattedValue()}',
                          priceLabel:
                              ' ${(e.price.isPriceOnCall ?? true) ? '' : e.price.label.title}',
                          address:
                              '${e.address.area.name}, ${e.address.city.name}',
                        ),
                      ))
                  ?.toList(),
            ),
          ),
        ],
      ),
    );
  }
}

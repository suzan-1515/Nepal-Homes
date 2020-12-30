import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/amenities.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/description.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/listing_agent.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/overview.dart';
import 'package:scoped_model/scoped_model.dart';

import 'address_view.dart';
import 'category_view.dart';
import 'image_carousel.dart';
import 'location_map.dart';
import 'price_view.dart';
import 'related_property.dart';
import 'ribbon_view.dart';

class DetailBody extends StatelessWidget {
  const DetailBody();

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (property.entity.media?.images?.isNotEmpty ?? false)
            DetailImageCarousel(
              images:
                  property.entity.media.images.map((e) => e.fullPath).toList(),
            ),
          const SizedBox(
            height: 8.0,
          ),
          const CategoryView(),
          const RibbonView(),
          const SizedBox(height: 8.0),
          const PriceView(),
          const SizedBox(height: 8.0),
          const AddressView(),
          const SizedBox(
            height: 16.0,
          ),
          const Overview(),
          SizedBox(height: 16.0),
          const Description(),
          SizedBox(height: 16.0),
          const ListingAgent(),
          SizedBox(height: 16.0),
          if (!(property.entity.basic.propertyCategory?.isLand() ?? true)) ...[
            const Amenities(),
            SizedBox(height: 16.0),
          ],
          const LocationMap(),
          SizedBox(height: 16.0),
          if (property.relatedProperties != null &&
              property.relatedProperties.isNotEmpty) ...[
            const RelatedProperty(),
            SizedBox(height: 8.0),
          ],
        ],
      ),
    );
  }
}

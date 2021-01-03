import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_grid_compact_item.dart';
import 'package:sizer/sizer.dart';

class PropertyHorizontalList extends StatelessWidget {
  final List<PropertyUIModel> properties;

  const PropertyHorizontalList({Key key, @required this.properties})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCoverHeight =
        SizerUtil.orientation == Orientation.portrait ? 120.0 : 150.0;
    final crossAxisExtent = 320.0;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: properties
            ?.map((e) => e.entity)
            ?.map<Widget>((e) => SizedBox(
                  width: crossAxisExtent,
                  child: PropertyGridCompactItem(
                    imageHeight: itemCoverHeight,
                    onTap: () => Navigator.pushNamed(
                      context,
                      PropertyDetailScreen.ROUTE_NAME,
                      arguments: PropertyDetailScreenArgs(e.slugUrl),
                    ),
                    image: (e.media?.images?.isEmpty ?? true)
                        ? null
                        : e.media?.images?.first?.fullPath,
                    price: e.price?.resolvedPrice,
                    priceLabel:
                        ' ${(e.price?.isPriceOnCall ?? true) ? '' : e.price.label.title}',
                    address: '${e.address.area.name}, ${e.address.city.name}',
                  ),
                ))
            ?.toList(),
      ),
    );
  }
}

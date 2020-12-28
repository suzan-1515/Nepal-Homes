import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';

class PropertyCategoryHorizontalList extends StatelessWidget {
  final List<PropertyCategoryEntity> categories;

  const PropertyCategoryHorizontalList({Key key, @required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories
            .map(
              (x) => InkWell(
                onTap: () {},
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AdvancedNetworkImage(x.media?.fullPath ??
                                  APIUrlConstants.DEFAULT_IMAGE_URL),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ]),
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        x.title,
                        style: theme.textTheme.subtitle1,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

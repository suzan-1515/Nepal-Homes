import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

import 'widgets/property_list.dart';

class FeaturedPropertyListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/property-featured';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PropertyProvider.featuredPropertyBlocProvider(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Featured Properties',
              style: theme.textTheme.subtitle1.copyWith(
                color: theme.appBarTheme.iconTheme.color,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const PropertyList(),
            ),
          ),
        ),
      ),
    );
  }
}

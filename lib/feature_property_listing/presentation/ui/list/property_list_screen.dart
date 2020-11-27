import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/widgets/property_list.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PropertyProvider.propertyBlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Properties'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const PropertyList(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_filter/property_filter_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_list/property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/filter/property_filter_screen.dart';
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
    return PropertyProvider.propertyMultiBlocProvider(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search properties',
                prefixIcon: Icon(LineAwesomeIcons.search),
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(LineAwesomeIcons.filter),
                onPressed: () => showDialog(
                  builder: (_) => BlocProvider<PropertyFilterCubit>.value(
                    value: context.read<PropertyFilterCubit>(),
                    child: PropertyFilterScreen(),
                  ),
                  context: context,
                ).then(
                  (value) {
                    if (value != null)
                      context
                          .read<PropertyCubit>()
                          .updateFilter(propertyFilter: value);
                  },
                ),
              ),
            ],
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

  @override
  bool get wantKeepAlive => true;
}

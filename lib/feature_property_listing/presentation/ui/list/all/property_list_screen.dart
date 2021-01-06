import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_filter/property_filter_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_list/property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/filter/property_filter_screen.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

import 'widgets/property_list.dart';

class PropertyListScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/property';

  const PropertyListScreen({Key key}) : super(key: key);

  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  PropertyQuery _query;

  PropertyQuery argsToQuery(args) => PropertyQuery(
        isFeatured: args?.isFeatured,
        isPremium: args?.isPremium,
        propertyCategoryId: args?.categoryId,
      );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PropertyListScreenArgs args = ModalRoute.of(context).settings.arguments;
    this._query = argsToQuery(args);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PropertyProvider.propertyMultiBlocProvider(
      query: _query,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Properties',
              style: theme.textTheme.subtitle1.copyWith(
                color: theme.appBarTheme.iconTheme.color,
              ),
            ),
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
              child: PropertyList(
                query: _query,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyListScreenArgs extends Equatable {
  final bool isFeatured;
  final bool isPremium;
  final String categoryId;

  PropertyListScreenArgs({this.isFeatured, this.isPremium, this.categoryId});

  factory PropertyListScreenArgs.fromMap(Map<String, dynamic> json) =>
      PropertyListScreenArgs(
          isFeatured: json['isFeatured'] == null
              ? null
              : json['isFeatured'].toLowerCase() == 'true',
          isPremium: json['isPremium'] == null
              ? null
              : json['isPremium'].toLowerCase() == 'true',
          categoryId: json['categoryId']);

  @override
  List<Object> get props => [isFeatured, isPremium, categoryId];

  @override
  bool get stringify => true;
}

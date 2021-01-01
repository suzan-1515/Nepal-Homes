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

  PropertyListScreen({Key key, this.args}) : super(key: key);
  final PropertyListScreenArgs args;

  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen>
    with AutomaticKeepAliveClientMixin {
  var _query;

  PropertyQuery get argsToQuery => PropertyQuery(
        isFeatured: widget.args?.isFeatured,
        isPremium: widget.args?.isPremium,
        propertyCategoryId: widget.args?.categoryId,
      );

  @override
  void initState() {
    super.initState();
    _query = argsToQuery;
  }

  @override
  void didUpdateWidget(covariant PropertyListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.args != null) _query = argsToQuery;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PropertyProvider.propertyMultiBlocProvider(
      query: _query,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Properties',
              style: Theme.of(context).textTheme.headline6,
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
              child: PropertyList(
                query: _query,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
}

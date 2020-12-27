import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_list/property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/widgets/property_list_builder.dart';

class PropertyList extends StatefulWidget {
  const PropertyList();

  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  var _propertyQuery = PropertyQuery();
  PropertyCubit _propertyQubit;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _propertyQubit = context.read<PropertyCubit>();
    _propertyQubit.getProperties(
      query: _propertyQuery,
    );
  }

  @override
  void dispose() {
    _refreshCompleter?.complete();
    super.dispose();
  }

  Future<void> _onRefresh() {
    _propertyQubit.refreshProperties(
      query: _propertyQuery,
    );
    return _refreshCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PropertyCubit, PropertyState>(
      listenWhen: (previous, current) =>
          !(current is PropertyLoading) && !(current is PropertyLoadingMore),
      listener: (context, state) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
        if (state is PropertyError) {
          context.showMessage(state.message);
        } else if (state is PropertyLoadError) {
          context.showMessage(state.message);
        } else if (state is PropertyFilterChanged) {
          _propertyQuery = state.filter.toQuery(_propertyQuery);
          context.read<PropertyCubit>().getProperties(query: _propertyQuery);
        }
      },
      buildWhen: (previous, current) =>
          !(current is PropertyError) &&
          !(current is PropertyLoadingMore) &&
          !(current is PropertyFilterChanged),
      builder: (context, state) {
        if (state is PropertyLoadSuccess) {
          return PropertyListBuilder(
            data: state.properties,
            hasMore: state.hasMore,
            onLoadMore: () =>
                _propertyQubit.getMoreProperties(query: _propertyQuery),
            onRefresh: _onRefresh,
          );
        } else if (state is PropertyLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () => _propertyQubit.getProperties(
                query: _propertyQuery,
              ),
            ),
          );
        } else if (state is PropertyLoadEmpty) {
          return Center(
            child: EmptyDataView(
              message: state.message,
            ),
          );
        }
        return Center(
          child: ProgressView(),
        );
      },
    );
  }
}

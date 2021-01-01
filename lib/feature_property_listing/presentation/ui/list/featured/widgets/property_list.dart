import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/featured_property_list/featured_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';

import '../../../widgets/property_list_builder.dart';

class PropertyList extends StatefulWidget {
  const PropertyList();

  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  FeaturedPropertyCubit _propertyQubit;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _propertyQubit = context.read<FeaturedPropertyCubit>();
    _propertyQubit.getProperties();
  }

  @override
  void dispose() {
    _refreshCompleter?.complete();
    super.dispose();
  }

  Future<void> _onRefresh() {
    _propertyQubit.refreshProperties();
    return _refreshCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedPropertyCubit, FeaturedPropertyState>(
      listenWhen: (previous, current) => !(current is FeaturedPropertyLoading),
      listener: (context, state) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
        if (state is FeaturedPropertyError) {
          context.showMessage(state.message);
        } else if (state is FeaturedPropertyLoadError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) => !(current is FeaturedPropertyError),
      builder: (context, state) {
        if (state is FeaturedPropertyLoadSuccess) {
          return PropertyListBuilder(
            data: state.properties.toUIModel,
            onRefresh: _onRefresh,
          );
        } else if (state is FeaturedPropertyLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () => _propertyQubit.getProperties(),
            ),
          );
        } else if (state is FeaturedPropertyLoadEmpty) {
          return Center(
            child: EmptyDataView(
              message: state.message,
            ),
          );
        }
        return Center(
          child: const ProgressView(),
        );
      },
    );
  }
}

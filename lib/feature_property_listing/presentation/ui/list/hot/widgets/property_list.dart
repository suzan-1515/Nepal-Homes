import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/hot_property_list/hot_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';

import '../../../widgets/property_list_builder.dart';

class PropertyList extends StatefulWidget {
  const PropertyList();

  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  HotPropertyCubit _propertyQubit;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _propertyQubit = context.read<HotPropertyCubit>();
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
    return BlocConsumer<HotPropertyCubit, HotPropertyState>(
      listenWhen: (previous, current) => !(current is HotPropertyLoading),
      listener: (context, state) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
        if (state is HotPropertyError) {
          context.showMessage(state.message);
        } else if (state is HotPropertyLoadError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) => !(current is HotPropertyError),
      builder: (context, state) {
        if (state is HotPropertyLoadSuccess) {
          return PropertyListBuilder(
            data: state.properties.toUIModel,
            onRefresh: _onRefresh,
          );
        } else if (state is HotPropertyLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () => _propertyQubit.getProperties(),
            ),
          );
        } else if (state is HotPropertyLoadEmpty) {
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

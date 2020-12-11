import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_filter/property_filter_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/filter_view.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:nepal_homes/core/extensions/view.dart';

class PropertyFilterScreen extends StatelessWidget {
  Widget _buildAppbar(
          {BuildContext context, Widget child, Widget floatingActionButton}) =>
      Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Theme.of(context).textTheme.headline6.color),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(LineAwesomeIcons.times),
            onPressed: () => Navigator.pop(context),
          ),
          automaticallyImplyLeading: false,
        ),
        body: child,
        floatingActionButton: floatingActionButton,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PropertyFilterCubit, PropertyFilterState>(
      listener: (context, state) {
        if (state is PropertyFilterLoadError) {
          context.showMessage(state.message);
        } else if (state is PropertyFilterError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) => !(current is PropertyFilterError),
      builder: (context, state) {
        if (state is PropertyFilterLoadSuccess) {
          return ScopedModel<FilterUIModel>(
            model: state.propertyFilter.toUIModel,
            child: Builder(
              builder: (context) => _buildAppbar(
                context: context,
                child: FilterView(),
                floatingActionButton: FloatingActionButton.extended(
                  heroTag: 'apply-filter-tag',
                  onPressed: () {
                    var filter = ScopedModel.of<FilterUIModel>(context).entity;
                    context
                        .read<PropertyFilterCubit>()
                        .applyFilter(propertyFilter: filter);
                    Navigator.pop(context, filter);
                  },
                  label: Text('Apply Filters'),
                  icon: Icon(LineAwesomeIcons.filter),
                ),
              ),
            ),
          );
        } else if (state is PropertyFilterLoadEmpty) {
          return _buildAppbar(
            context: context,
            child: Center(
              child: EmptyDataView(
                message: state.message,
              ),
            ),
          );
        } else if (state is PropertyFilterLoadError) {
          return _buildAppbar(
            context: context,
            child: Center(
              child: ErrorDataView(
                onRetry: () => context.read<PropertyFilterCubit>().getMeta(),
                message: state.message,
              ),
            ),
          );
        }

        return _buildAppbar(
          context: context,
          child: Center(
            child: ProgressView(),
          ),
        );
      },
    );
  }
}

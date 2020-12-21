import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_detail/property_detail_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/detail_body.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:nepal_homes/core/extensions/view.dart';

import 'widgets/appbar.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/property-detail';

  @override
  Widget build(BuildContext context) {
    final PropertyDetailScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    return PropertyProvider.propertyDetailBlocProvider(
      slug: args.id,
      child: Builder(
        builder: (context) => Scaffold(
          body: BlocConsumer<PropertyDetailCubit, PropertyDetailState>(
            listener: (context, state) {
              if (state is PropertyDetailLoadError) {
                context.showMessage(state.message);
              }
            },
            builder: (context, state) {
              if (state is PropertyDetailLoadSuccess) {
                return ScopedModel<PropertyDetailUIModel>(
                  model: state.propertyDetailEntity.toUIModel,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: DetailSliverAppbar(
                          isCollapsed: innerBoxIsScrolled,
                        ),
                      ),
                    ],
                    body: Builder(
                      builder: (context) => CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverToBoxAdapter(
                            child: const DetailBody(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is PropertyDetailLoadEmpty) {
                return Center(
                  child: EmptyDataView(
                    message: state.message,
                  ),
                );
              } else if (state is PropertyDetailLoadError) {
                return Center(
                  child: ErrorDataView(
                    message: state.message,
                    onRetry: () => context
                        .read<PropertyDetailCubit>()
                        .getDetail(slug: args.id),
                  ),
                );
              }

              return Center(
                child: ProgressView(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PropertyDetailScreenArgs {
  final String id;
  final PropertyUIModel propertyUIModel;

  PropertyDetailScreenArgs(this.id, {this.propertyUIModel});
}

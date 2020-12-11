import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_detail/property_detail_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/detail_body.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/options_view.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:scoped_model/scoped_model.dart';

import 'widgets/shade_icon.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/property-detail';
  @override
  Widget build(BuildContext context) {
    final PropertyDetailScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return PropertyProvider.propertyDetailBlocProvider(
      slug: args.id,
      child: Builder(
        builder: (context) => Scaffold(
          body: BlocConsumer<PropertyDetailCubit, PropertyDetailState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PropertyDetailLoadSuccess) {
                return ScopedModel<PropertyDetailUIModel>(
                  model: state.propertyDetailEntity.toUIModel,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        leading: ShadeIcon(
                          icon: Icon(
                            LineAwesomeIcons.angle_left,
                            color: Colors.white,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        actions: [
                          ShadeIcon(
                            icon: Icon(
                              LineAwesomeIcons.heart_1,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          ),
                          ShadeIcon(
                            icon: Icon(
                              LineAwesomeIcons.share,
                              color: Colors.white,
                            ),
                            onTap: () {},
                          ),
                        ],
                        expandedHeight: size.height * 0.5,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 50,
                                child: CachedImage(state.propertyDetailEntity
                                        .media.images?.first?.fullPath ??
                                    ''),
                              ),
                              Positioned(
                                left: 16.0,
                                right: 16.0,
                                bottom: 5,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 2,
                                        color: Colors.grey.shade400,
                                      )
                                    ],
                                  ),
                                  child: Material(child: OptionsView()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: const DetailBody(),
                      ),
                    ],
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
          // floatingActionButton: FloatingActionButton.extended(
          //   heroTag: 'property-detail-chk-avlb',
          //   onPressed: () {},
          //   label: Text('Check Availability'),
          // ),
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

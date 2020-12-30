import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_horizontal_list.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/featured_property_list/featured_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/core/extensions/view.dart';

import 'section_container.dart';
import 'section_heading.dart';

class FeaturedPropertySection extends StatelessWidget {
  const FeaturedPropertySection();
  @override
  Widget build(BuildContext context) {
    return PropertyProvider.featuredPropertyBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Featured Properties',
          onViewAllTap: () {},
        ),
        content: BlocConsumer<FeaturedPropertyCubit, FeaturedPropertyState>(
          listener: (context, state) {
            if (state is FeaturedPropertyError) {
              context.showMessage(state.message);
            } else if (state is FeaturedPropertyLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is FeaturedPropertyLoadSuccess) {
              return PropertyHorizontalList(
                  properties: state.properties.toUIModel);
            } else if (state is FeaturedPropertyLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () =>
                      context.read<FeaturedPropertyCubit>().getProperties(),
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
        ),
      ),
    );
  }
}

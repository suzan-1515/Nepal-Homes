import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_main/presentation/blocs/main/main_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/recent_property_list/recent_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_horizontal_list.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

import 'section_container.dart';
import 'section_heading.dart';

class RecentPropertySection extends StatelessWidget {
  const RecentPropertySection();

  @override
  Widget build(BuildContext context) {
    return PropertyProvider.recentPropertyBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Recent Properties',
          onViewAllTap: () => context.read<MainCubit>().navItemSelected(1),
        ),
        content: BlocConsumer<RecentPropertyCubit, RecentPropertyState>(
          listener: (context, state) {
            if (state is RecentPropertyError) {
              context.showMessage(state.message);
            } else if (state is RecentPropertyLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is RecentPropertyLoadSuccess) {
              return PropertyHorizontalList(
                  properties: state.properties.toUIModel);
            } else if (state is RecentPropertyLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () =>
                      context.read<RecentPropertyCubit>().getProperties(),
                ),
              );
            } else if (state is RecentPropertyLoadEmpty) {
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

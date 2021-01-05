import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/core/widgets/section_container.dart';
import 'package:nepal_homes/core/widgets/section_heading.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/hot_property_list/hot_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/extensions/property_extensions.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_horizontal_list.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

class HotPropertySection extends StatelessWidget {
  const HotPropertySection();

  @override
  Widget build(BuildContext context) {
    return PropertyProvider.hotPropertyBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Hot Properties',
          onViewAllTap: () =>
              LinkUtils.openLink('app://nepalhomes/property?isPremium=true'),
        ),
        content: BlocConsumer<HotPropertyCubit, HotPropertyState>(
          listener: (context, state) {
            if (state is HotPropertyError) {
              context.showMessage(state.message);
            } else if (state is HotPropertyLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is HotPropertyLoadSuccess) {
              return PropertyHorizontalList(
                  properties: state.properties.toUIModel);
            } else if (state is HotPropertyLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () =>
                      context.read<HotPropertyCubit>().getProperties(),
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
        ),
      ),
    );
  }
}

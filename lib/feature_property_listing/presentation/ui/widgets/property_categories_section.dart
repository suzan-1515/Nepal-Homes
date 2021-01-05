import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/core/widgets/section_container.dart';
import 'package:nepal_homes/core/widgets/section_heading.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_category/property_category_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_category_horizontal_list.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

class PropertyCategoriesSection extends StatelessWidget {
  const PropertyCategoriesSection();

  @override
  Widget build(BuildContext context) {
    return PropertyProvider.propertyCategoryBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Explore NepalHomes',
        ),
        content: BlocConsumer<PropertyCategoryCubit, PropertyCategoryState>(
            listener: (context, state) {
          if (state is PropertyCategoryError) {
            context.showMessage(state.message);
          } else if (state is PropertyCategoryLoadError) {
            context.showMessage(state.message);
          }
        }, builder: (context, state) {
          if (state is PropertyCategoryLoadSuccess) {
            return PropertyCategoryHorizontalList(
                categories: state.propertyCategories);
          } else if (state is PropertyCategoryLoadError) {
            return Center(
              child: ErrorDataView(
                message: state.message,
                onRetry: () =>
                    context.read<PropertyCategoryCubit>().getCategories(),
              ),
            );
          } else if (state is PropertyCategoryLoadEmpty) {
            return Center(
              child: EmptyDataView(
                message: state.message,
              ),
            );
          }
          return Center(
            child: const ProgressView(),
          );
        }),
      ),
    );
  }
}

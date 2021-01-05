import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/category_news_list/category_news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';

import 'category_news_list_builder.dart';

class CategoryNewsList extends StatelessWidget {
  const CategoryNewsList({@required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryNewsListCubit, CategoryNewsListState>(
      listener: (context, state) {
        if (state is CategoryNewsListLoadError) {
          context.showMessage(state.message);
        } else if (state is CategoryNewsListError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) =>
          !(current is CategoryNewsListLoadingMore) &&
          !(current is CategoryNewsListError),
      builder: (context, state) {
        if (state is CategoryNewsListLoadSuccess) {
          return CategoryNewsListBuilder(
            data: state.news.toUIModel,
            hasMore: state.hasMore,
            onLoadMore: () => context
                .read<CategoryNewsListCubit>()
                .getMoreCategoryNews(categorySlug: slug),
          );
        } else if (state is CategoryNewsListLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () => context
                  .read<CategoryNewsListCubit>()
                  .getCategoryNews(categorySlug: slug),
            ),
          );
        } else if (state is CategoryNewsListLoadEmpty) {
          return Center(
            child: EmptyDataView(
              message: state.message,
            ),
          );
        }
        return const Center(child: const ProgressView());
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_category/news_category_cubit.dart';

import 'news_list_builder.dart';

class NewsList extends StatelessWidget {
  const NewsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCategoryCubit, NewsCategoryState>(
      buildWhen: (previous, current) =>
          !(current is NewsCategoryLoadingMore) &&
          !(current is NewsCategoryError),
      builder: (context, state) {
        if (state is NewsCategoryLoadSuccess) {
          return NewsListBuilder(
            categories: state.categories,
          );
        }
        return const Center(child: const ProgressView());
      },
    );
  }
}

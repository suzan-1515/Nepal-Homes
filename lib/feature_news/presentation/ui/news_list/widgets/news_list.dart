import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_list/news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';

import 'news_list_builder.dart';

class NewsList extends StatelessWidget {
  const NewsList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsListCubit, NewsState>(
      listener: (context, state) {
        if (state is NewsLoadError) {
          context.showMessage(state.message);
        } else if (state is NewsError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) =>
          !(current is NewsLoadingMore) && !(current is NewsError),
      builder: (context, state) {
        if (state is NewsLoadSuccess) {
          return NewsListBuilder(
            data: state.news.toUIModel,
            hasMore: state.hasMore,
            onLoadMore: () => context.read<NewsListCubit>().getMoreNews(),
          );
        } else if (state is NewsLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () => context.read<NewsListCubit>().getNews(),
            ),
          );
        } else if (state is NewsLoadEmpty) {
          return Center(
            child: EmptyDataView(
              message: state.message,
            ),
          );
        }
        return Center(child: const ProgressView());
      },
    );
  }
}

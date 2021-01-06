import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/author_news/author_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';

import 'author_news_list_builder.dart';

class AuthorNewsList extends StatelessWidget {
  const AuthorNewsList({@required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorNewsCubit, AuthorNewsState>(
      listener: (context, state) {
        if (state is AuthorNewsLoadError) {
          context.showMessage(state.message);
        } else if (state is AuthorNewsError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) =>
          !(current is AuthorNewsLoadingMore) && !(current is AuthorNewsError),
      builder: (context, state) {
        if (state is AuthorNewsLoadSuccess) {
          return AuthorNewsListBuilder(
            data: state.news.toUIModel,
            hasMore: state.hasMore,
            onLoadMore: () =>
                context.read<AuthorNewsCubit>().getMoreNews(authorId: id),
          );
        } else if (state is AuthorNewsLoadError) {
          return Center(
            child: ErrorDataView(
              message: state.message,
              onRetry: () =>
                  context.read<AuthorNewsCubit>().getAuthorNews(authorId: id),
            ),
          );
        } else if (state is AuthorNewsLoadEmpty) {
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

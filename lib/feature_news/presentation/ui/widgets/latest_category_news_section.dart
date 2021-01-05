import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/core/widgets/section_container.dart';
import 'package:nepal_homes/core/widgets/section_heading.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_category_news_list/latest_category_news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/news_horizontal_list.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

class LatestCategoryNewsSection extends StatelessWidget {
  const LatestCategoryNewsSection(
      {@required this.id, @required this.title, @required this.slug});

  final String id;
  final String slug;
  final String title;

  @override
  Widget build(BuildContext context) {
    return NewsProvider.latestCategoryNewsBlocProvider(
      id: id,
      child: SectionContainer(
        heading: SectionHeading(
          title: title ?? '',
          onViewAllTap: () => LinkUtils.openLink(
              'app://nepalhomes/category-news/$slug?title=$title'),
        ),
        content: BlocConsumer<LatestCategoryNewsListCubit,
            LatestCategoryNewsListState>(
          listener: (context, state) {
            if (state is LatestCategoryNewsListError) {
              context.showMessage(state.message);
            } else if (state is LatestCategoryNewsListLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is LatestCategoryNewsListLoadSuccess) {
              return NewsHorizontalList(newsList: state.news.toUIModel);
            } else if (state is LatestCategoryNewsListLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () => context
                      .read<LatestCategoryNewsListCubit>()
                      .getCategoryNews(categoryId: id),
                ),
              );
            } else if (state is LatestCategoryNewsListLoadEmpty) {
              return Center(
                child: EmptyDataView(
                  message: state.message,
                ),
              );
            }
            return const Center(
              child: const ProgressView(),
            );
          },
        ),
      ),
    );
  }
}

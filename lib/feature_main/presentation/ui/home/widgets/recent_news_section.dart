import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_news/latest_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/latest_news_horizontal_list.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

import 'section_container.dart';
import 'section_heading.dart';

class RecentNewsSection extends StatelessWidget {
  const RecentNewsSection();

  @override
  Widget build(BuildContext context) {
    return NewsProvider.latestNewsBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Recent News',
          onViewAllTap: () {},
        ),
        content: BlocConsumer<LatestNewsCubit, LatestNewsState>(
          listener: (context, state) {
            if (state is LatestNewsError) {
              context.showMessage(state.message);
            } else if (state is LatestNewsLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is LatestNewsLoadSuccess) {
              return LatestNewsHorizontalList(newsList: state.news.toUIModel);
            } else if (state is LatestNewsLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () => context.read<LatestNewsCubit>().getNews(),
                ),
              );
            } else if (state is LatestNewsLoadEmpty) {
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

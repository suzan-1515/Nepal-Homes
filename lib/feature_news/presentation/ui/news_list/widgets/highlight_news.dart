import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/highlight_news/highlight_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';

import 'news_thumbnail_item.dart';

class HighlightNews extends StatelessWidget {
  const HighlightNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightNewsCubit, HighlightNewsState>(
        builder: (context, state) {
      if (state is HighlightNewsLoadSuccess) {
        return FadeInUp(
          duration: const Duration(milliseconds: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.news.toUIModel
                .map<Widget>((e) => NewsThumbnailItem(
                      id: e.entity.id,
                      title: e.entity.title,
                      image: e.entity.image?.fullPath,
                      date:
                          '${e.entity.addedAt?.formattedDate}  •  ${e.entity.addedAt?.momentAgo}',
                      onTap: () => Navigator.pushNamed(
                        context,
                        NewsDetailScreen.ROUTE_NAME,
                        arguments: NewsDetailScreenArgs(
                          e.entity.id,
                          title: e.entity.title,
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      } else if (state is HighlightNewsLoading) {
        return const Center(
          child: const ProgressView(),
        );
      }

      return SizedBox.shrink();
    });
  }
}

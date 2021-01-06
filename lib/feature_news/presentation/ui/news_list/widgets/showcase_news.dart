import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/showcase_news/showcase_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/news_list_compact_item.dart';

import 'news_thumbnail_item.dart';

class ShowcaseNews extends StatelessWidget {
  const ShowcaseNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowcaseNewsCubit, ShowcaseNewsState>(
      builder: (context, state) {
        if (state is ShowcaseNewsLoadSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.news
                .take(1)
                .map((e) => e.toUIModel)
                .map<Widget>(
                  (e) => NewsThumbnailItem(
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
                  ),
                )
                .followedBy(
                    state.news.skip(1).map((e) => e.toUIModel).map<Widget>(
                          (e) => NewsListCompactItem(
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
                          ),
                        ))
                .toList(),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

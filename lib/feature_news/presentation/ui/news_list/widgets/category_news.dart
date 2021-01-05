import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/section_container.dart';
import 'package:nepal_homes/core/widgets/section_heading.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_category_news_list/latest_category_news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/models/category_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/news_list_compact_item.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';
import 'package:scoped_model/scoped_model.dart';

import 'news_thumbnail_item.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryUIModel = ScopedModel.of<NewsCategoryUIModel>(context);
    return NewsProvider.latestCategoryNewsBlocProvider(
      id: categoryUIModel.entity.id,
      child: Builder(
        builder: (context) => BlocBuilder<LatestCategoryNewsListCubit,
            LatestCategoryNewsListState>(builder: (context, state) {
          if (state is LatestCategoryNewsListLoadSuccess) {
            return FadeInUp(
              duration: const Duration(milliseconds: 200),
              child: SectionContainer(
                heading: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                  child: SectionHeading(
                    title: categoryUIModel.entity.title,
                    onViewAllTap: () => LinkUtils.openLink(
                        'app://nepalhomes/category-news/${categoryUIModel.entity.slugUrl}?title=${categoryUIModel.entity.title}'),
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: state.news
                      .take(1)
                      .map((e) => e.toUIModel)
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
                      .followedBy(state.news
                          .skip(1)
                          .map(
                            (e) => e.toUIModel,
                          )
                          .map<Widget>(
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
                ),
              ),
            );
          }

          return SizedBox.shrink();
        }),
      ),
    );
  }
}

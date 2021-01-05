import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/models/category_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_list/widgets/showcase_news.dart';
import 'package:scoped_model/scoped_model.dart';

import 'category_news.dart';
import 'highlight_news.dart';
import 'recent_news.dart';
import 'trending_news.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    Key key,
    this.categories,
  }) : super(key: key);

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const HighlightNews(),
            const ShowcaseNews(),
            const TrendingNews(),
            const RecentNews(),
            ...?categories
                ?.map<Widget>(
                  (e) => ScopedModel<NewsCategoryUIModel>(
                    model: e.toUIModel,
                    child: const CategoryNews(),
                  ),
                )
                ?.toList(),
          ],
        ),
      ),
    );
  }
}

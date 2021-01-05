import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_author.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_description.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_publisher_info.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/related_news.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/latest_category_news_section.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/recent_news_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/featured_properties_section.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/hot_properties_section.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

import 'cover_image.dart';
import 'news_title.dart';

class NewsDetailBody extends StatelessWidget {
  const NewsDetailBody({Key key});

  @override
  Widget build(BuildContext context) {
    final newsDetailUIModel = ScopedModel.of<NewsDetailUIModel>(context);
    final coverImageHeight =
        SizerUtil.orientation == Orientation.portrait ? 250.0 : 200.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CoverImage(
          image: newsDetailUIModel.entity.image?.fullPath,
          imageHeight: coverImageHeight,
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NewsTitle(
              title: newsDetailUIModel.entity.title,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: PublisherInfo(
            author: newsDetailUIModel.entity.authors?.first,
            publishedDate: newsDetailUIModel.entity.addedAt?.formattedDate,
          ),
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: NewsDescription(
              description: newsDetailUIModel.entity.description,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Divider(),
        ),
        ...?newsDetailUIModel.entity.authors
            ?.map<Widget>(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: NewsAuthor(
                  author: e,
                ),
              ),
            )
            ?.toList(),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: const RecentNewsSection(),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: const LatestCategoryNewsSection(
              id: '5e50eeb43a2d6e0439d7d307',
              title: 'कानुन र कर',
              slug: 'laws-taxes'),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: const LatestCategoryNewsSection(
              id: '5d8776d06632a20550bc4916',
              title: 'घरकर्जा',
              slug: 'home-loan'),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: RelatedNews(
            newsId: newsDetailUIModel.entity.id,
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: const HotPropertySection(),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: const FeaturedPropertySection(),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

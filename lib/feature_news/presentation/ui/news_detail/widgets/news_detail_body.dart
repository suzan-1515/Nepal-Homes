import 'package:flutter/material.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_author.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_description.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_publisher_info.dart';
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
        SizerUtil.orientation == Orientation.portrait ? 300.0 : 200.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CoverImage(
          image: newsDetailUIModel.entity.image?.fullPath,
          imageHeight: coverImageHeight,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: NewsTitle(
            title: newsDetailUIModel.entity.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: PublisherInfo(
            author: newsDetailUIModel.entity.authors?.first,
            publishedDate: newsDetailUIModel.entity.addedAt?.formattedDate,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: NewsDescription(
            description: newsDetailUIModel.entity.description,
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
      ],
    );
  }
}

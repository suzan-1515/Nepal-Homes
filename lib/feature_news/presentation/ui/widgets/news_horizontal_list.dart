import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_model.dart';
import 'package:sizer/sizer.dart';

import 'news_grid_compact_item.dart';

class NewsHorizontalList extends StatelessWidget {
  final List<NewsUIModel> newsList;

  const NewsHorizontalList({Key key, @required this.newsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCoverHeight =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? 120.0
            : 150.0;
    final crossAxisExtent = 320.0;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: newsList
            ?.map((e) => e.entity)
            ?.map<Widget>((e) => SizedBox(
                  width: crossAxisExtent,
                  child: NewsGridCompactItem(
                    id: e.id,
                    imageHeight: itemCoverHeight,
                    onTap: () => LinkUtils.openLink(
                        'app://nepalhomes/news-detail/${e.id}?title=${e.title}'),
                    image: (e.image?.fullPath ??
                        APIUrlConstants.DEFAULT_IMAGE_URL),
                    title: e.title,
                    date: e.addedAt?.momentAgo,
                    author: (e.authors?.isEmpty ?? true)
                        ? null
                        : e.authors?.first?.name,
                  ),
                ))
            ?.toList(),
      ),
    );
  }
}

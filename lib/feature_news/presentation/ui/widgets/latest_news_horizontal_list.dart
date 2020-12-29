import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_model.dart';

import 'news_grid_compact_item.dart';

class LatestNewsHorizontalList extends StatelessWidget {
  final List<NewsUIModel> newsList;

  const LatestNewsHorizontalList({Key key, @required this.newsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crossAxisExtent = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width * 0.7
        : MediaQuery.of(context).size.width * 0.4;
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
                    onTap: () {},
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

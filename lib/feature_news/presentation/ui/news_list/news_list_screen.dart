import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

import 'widgets/news_list.dart';

class NewsListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/agencies';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return NewsProvider.newsBlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const NewsList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_list/widgets/news_list.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

class NewsListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/news';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return NewsProvider.newsMultiBlocProvider(
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

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

import 'widgets/category_news_list.dart';

class CategoryNewsListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/category-news';

  @override
  Widget build(BuildContext context) {
    final CategoryNewsListScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final ThemeData theme = Theme.of(context);
    return NewsProvider.categoryNewsBlocProvider(
      id: args.slug,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.title ?? 'News',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryNewsList(slug: args.slug),
          ),
        ),
      ),
    );
  }
}

class CategoryNewsListScreenArgs extends Equatable {
  final String slug;
  final String title;

  CategoryNewsListScreenArgs(this.slug, {this.title});

  @override
  List<Object> get props => [slug, title];

  @override
  bool get stringify => true;
}

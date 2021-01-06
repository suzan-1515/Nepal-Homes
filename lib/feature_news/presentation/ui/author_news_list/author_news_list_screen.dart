import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

import 'widgets/author_news_list.dart';

class AuthorNewsListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/author-news';

  @override
  Widget build(BuildContext context) {
    final AuthorNewsListScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final ThemeData theme = Theme.of(context);
    return NewsProvider.authorNewsBlocProvider(
      authorId: args.id,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News by ${args.title ?? 'Author'}',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AuthorNewsList(id: args.id),
          ),
        ),
      ),
    );
  }
}

class AuthorNewsListScreenArgs extends Equatable {
  final String id;
  final String title;

  AuthorNewsListScreenArgs(this.id, {this.title});

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/services/share_service.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_detail/news_detail_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/widgets/news_detail_body.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/news-detail';

  @override
  Widget build(BuildContext context) {
    final NewsDetailScreenArgs args = ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);
    return NewsProvider.newsDetailBlocProvider(
      id: args.id,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: 'news-hero-title-${args.id}',
              child: Text(
                '${args.title ?? ''}',
                style: theme.textTheme.subtitle1.copyWith(
                  color: theme.appBarTheme.iconTheme.color,
                ),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(LineAwesomeIcons.alternate_share_square),
                  onPressed: () => GetIt.I.get<ShareService>().share(
                        threadId: args.id,
                        data: args.title,
                      ))
            ],
          ),
          body: SafeArea(
            child: BlocConsumer<NewsDetailCubit, NewsDetailState>(
              listener: (context, state) {
                if (state is NewsDetailError) {
                  context.showMessage(state.message);
                } else if (state is NewsDetailLoadError) {
                  context.showMessage(state.message);
                }
              },
              buildWhen: (previous, current) => !(current is NewsDetailError),
              builder: (context, state) {
                if (state is NewsDetailLoadSuccess) {
                  return SingleChildScrollView(
                    child: ScopedModel<NewsDetailUIModel>(
                        model: state.news.toUIModel,
                        child: const NewsDetailBody()),
                  );
                } else if (state is NewsDetailLoadEmpty) {
                  return Center(
                    child: EmptyDataView(
                      message: state.message,
                    ),
                  );
                } else if (state is NewsDetailLoadError) {
                  return Center(
                    child: ErrorDataView(
                      message: state.message,
                      onRetry: () => context
                          .read<NewsDetailCubit>()
                          .getNewsDetail(id: args.id),
                    ),
                  );
                }

                return const Center(
                  child: const ProgressView(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NewsDetailScreenArgs extends Equatable {
  final String id;
  final String title;

  NewsDetailScreenArgs(this.id, {@required this.title});

  factory NewsDetailScreenArgs.fromMap(Map<String, dynamic> json) =>
      NewsDetailScreenArgs(
        json['id'],
        title: json['title'],
      );

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}

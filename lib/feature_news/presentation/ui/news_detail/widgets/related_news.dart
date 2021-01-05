import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/section_container.dart';
import 'package:nepal_homes/core/widgets/section_heading.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/related_news/related_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/extensions/news_extensions.dart';
import 'package:nepal_homes/feature_news/utils/provider.dart';

import '../../widgets/news_horizontal_list.dart';

class RelatedNews extends StatelessWidget {
  const RelatedNews({@required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context) {
    return NewsProvider.relatedNewsBlocProvider(
      newsId: newsId,
      child: BlocBuilder<RelatedNewsCubit, RelatedNewsState>(
        builder: (context, state) {
          if (state is RelatedNewsLoadSuccess) {
            return SectionContainer(
              heading: SectionHeading(
                title: 'Related News',
              ),
              content: NewsHorizontalList(newsList: state.news.toUIModel),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

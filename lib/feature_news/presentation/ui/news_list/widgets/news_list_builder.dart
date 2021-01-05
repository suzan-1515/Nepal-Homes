import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nepal_homes/core/extensions/date_time.dart';
import 'package:nepal_homes/core/view/content_view_style.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_model.dart';
import 'package:nepal_homes/feature_news/presentation/ui/news_detail/news_detail_screen.dart';
import 'package:nepal_homes/feature_news/presentation/ui/widgets/news_list_item.dart';
import 'package:sizer/sizer.dart';

class NewsListBuilder extends StatelessWidget {
  final List<NewsUIModel> data;
  final bool hasMore;
  final Function onLoadMore;
  final ContentViewStyle contentViewStyle;

  const NewsListBuilder({
    Key key,
    @required this.data,
    this.hasMore = false,
    this.onLoadMore,
    this.contentViewStyle = ContentViewStyle.LIST_VIEW,
  })  : assert(data != null, 'News list data cannot be null'),
        super(key: key);

  bool _shouldShowLoadMore(index) => hasMore && (index == data.length);

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        SizerUtil.orientation == Orientation.portrait ? 1 : 2;
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: crossAxisCount,
        itemCount: hasMore ? data.length + 1 : data.length,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) {
          if (_shouldShowLoadMore(index)) {
            onLoadMore();
            return Center(
              child: ProgressView(),
            );
          }
          var item = data[index];
          return NewsListItem(
            id: item.entity.id,
            title: item.entity.title,
            image: item.entity.image?.fullPath,
            date:
                '${item.entity.addedAt?.formattedDate}  •  ${item.entity.addedAt?.momentAgo}',
            description: item.entity.shortDescription,
            onTap: () => Navigator.pushNamed(
              context,
              NewsDetailScreen.ROUTE_NAME,
              arguments: NewsDetailScreenArgs(
                item.entity.id,
                title: item.entity.title,
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      ),
    );
  }
}

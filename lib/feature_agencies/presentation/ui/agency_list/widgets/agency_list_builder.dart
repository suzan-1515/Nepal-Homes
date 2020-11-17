import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nepal_homes/core/view/content_view_style.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/widgets/agency_list_view_item.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyListBuilder extends StatelessWidget {
  final List<AgencyUIModel> data;
  final bool hasMore;
  final Function onLoadMore;
  final ContentViewStyle contentViewStyle;

  const AgencyListBuilder({
    Key key,
    @required this.data,
    this.hasMore = false,
    this.onLoadMore,
    this.contentViewStyle = ContentViewStyle.LIST_VIEW,
  })  : assert(data != null, 'Agency list data cannot be null'),
        super(key: key);

  bool _shouldShowLoadMore(index) => hasMore && (index == data.length);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
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
          var view;
          switch (contentViewStyle) {
            case ContentViewStyle.LIST_VIEW:
              view = const AgencyListViewItem();
              break;
            case ContentViewStyle.THUMBNAIL_VIEW:
              view = const AgencyListViewItem();
              break;
            case ContentViewStyle.COMPACT_VIEW:
              view = const AgencyListViewItem();
              break;
          }
          return ScopedModel<AgencyUIModel>(
            model: item,
            child: view,
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}

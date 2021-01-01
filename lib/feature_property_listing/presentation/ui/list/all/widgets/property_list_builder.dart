import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/property_list_item.dart';

class PropertyListBuilder extends StatelessWidget {
  final List<PropertyUIModel> data;
  final RefreshCallback onRefresh;
  final VoidCallback onLoadMore;
  final bool hasMore;

  const PropertyListBuilder(
      {@required this.data,
      this.onRefresh,
      this.onLoadMore,
      this.hasMore = false});

  _buildList() {
    final itemCoverHeight =
        SizerUtil.orientation == Orientation.portrait ? 30.0.w : 20.0.h;
    return ListView.separated(
      itemCount: hasMore ? data.length + 1 : data.length,
      itemBuilder: (context, index) {
        if (hasMore && (index) == data.length) {
          onLoadMore();
          return Center(
            child: ProgressView(),
          );
        }
        return ScopedModel<PropertyUIModel>(
          model: data[index],
          child: PropertyListItem(
            coverHeight: itemCoverHeight,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 8.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return onRefresh == null
        ? _buildList()
        : RefreshIndicator(
            onRefresh: onRefresh,
            child: _buildList(),
          );
  }
}
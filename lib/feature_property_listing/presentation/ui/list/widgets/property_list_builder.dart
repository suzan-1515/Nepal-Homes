import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/widgets/property_list_header.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/widgets/property_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyListBuilder extends StatelessWidget {
  final List<PropertyUIModel> data;
  final VoidCallback onRefresh;
  final VoidCallback onLoadMore;
  final bool hasMore;

  const PropertyListBuilder(
      {@required this.data,
      this.onRefresh,
      this.onLoadMore,
      this.hasMore = false});

  _buildList() => ListView.separated(
        itemCount: (hasMore ? data.length + 1 : data.length) + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const PropertyListHeader();
          }
          if (hasMore && (index - 1) == data.length) {
            onLoadMore();
            return Center(
              child: ProgressView(),
            );
          }
          return ScopedModel<PropertyUIModel>(
            model: data[index - 1],
            child: const PropertyListItem(),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 8.0,
        ),
      );

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

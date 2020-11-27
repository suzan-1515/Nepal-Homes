import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
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

  _buildList() => ListView.builder(
        itemCount: hasMore ? data.length + 1 : data.length,
        itemBuilder: (context, index) {
          if (hasMore && index == data.length) {
            onLoadMore();
            return Center(
              child: ProgressView(),
            );
          }
          return ScopedModel<PropertyUIModel>(
            model: data[index],
            child: const PropertyListItem(),
          );
        },
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

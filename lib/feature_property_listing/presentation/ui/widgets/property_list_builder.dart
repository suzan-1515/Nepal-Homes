import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/property_detail_screen.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_grid_compact_item.dart';
import 'package:sizer/sizer.dart';

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

  _buildList(BuildContext context) {
    final itemCoverHeight =
        SizerUtil.orientation == Orientation.portrait ? 120.0 : 150.0;
    final crossAxisCount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2;
    return StaggeredGridView.countBuilder(
      itemCount: hasMore ? data.length + 1 : data.length,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      crossAxisCount: crossAxisCount,
      itemBuilder: (context, index) {
        if (hasMore && (index) == data.length) {
          onLoadMore();
          return Center(
            child: ProgressView(),
          );
        }
        final propertyUIModel = data[index];
        return PropertyGridCompactItem(
          imageHeight: itemCoverHeight,
          onTap: () => Navigator.pushNamed(
            context,
            PropertyDetailScreen.ROUTE_NAME,
            arguments: PropertyDetailScreenArgs(propertyUIModel.entity.slugUrl),
          ),
          image: (propertyUIModel.entity.media?.images?.isEmpty ?? true)
              ? null
              : propertyUIModel.entity.media?.images?.first?.fullPath,
          price: propertyUIModel.entity.price?.resolvedPrice,
          priceLabel:
              ' ${(propertyUIModel.entity.price?.isPriceOnCall ?? true) ? '' : propertyUIModel.entity.price.label.title}',
          address:
              '${propertyUIModel.entity.address.area.name}, ${propertyUIModel.entity.address.city.name}',
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return onRefresh == null
        ? _buildList(context)
        : RefreshIndicator(
            onRefresh: onRefresh,
            child: _buildList(context),
          );
  }
}

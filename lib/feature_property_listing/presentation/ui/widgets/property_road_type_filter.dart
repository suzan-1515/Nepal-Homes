import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/road_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_road_type_filter_item.dart';

import 'filter_section_header.dart';

class PropertyRoadTypeFilter extends StatelessWidget {
  final FilterUIModel filter;

  const PropertyRoadTypeFilter({
    Key key,
    @required this.filter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterSectionHeader(title: 'Road Type'),
        RoadTypeFilterOptionsView(
          data: filter.entity.propertyMeta.roadTypes,
          selectedItem: filter.entity.roadType,
          onChanged: (value) => filter.entity =
              filter.entity.copyWith(roadType: Nullable<RoadTypeEntity>(value)),
        ),
      ],
    );
  }
}

class RoadTypeFilterOptionsView extends StatefulWidget {
  const RoadTypeFilterOptionsView({
    Key key,
    @required this.data,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  final List<RoadTypeEntity> data;
  final RoadTypeEntity selectedItem;
  final ValueChanged<RoadTypeEntity> onChanged;

  @override
  _CategoryFilterOptionsViewState createState() =>
      _CategoryFilterOptionsViewState();
}

class _CategoryFilterOptionsViewState extends State<RoadTypeFilterOptionsView> {
  RoadTypeEntity _selectedItem;
  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      children: widget.data
          .map<RoadTypeFilterItem>(
            (e) => RoadTypeFilterItem(
              title: e.title,
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? e : null;
                  widget.onChanged(_selectedItem);
                });
              },
              selected: _selectedItem == e,
            ),
          )
          .toList(),
    );
  }
}

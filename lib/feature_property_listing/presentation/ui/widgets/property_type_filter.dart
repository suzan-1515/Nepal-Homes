import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_type_filter_item.dart';

import 'filter_section_header.dart';

class PropertyTypeFilter extends StatelessWidget {
  final FilterUIModel filter;

  const PropertyTypeFilter({
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
        FilterSectionHeader(title: 'Property Type'),
        TypeFilterOptionsView(
          data: filter.entity.propertyMeta.propertyTypes,
          selectedItem: filter.entity.propertyType,
          onChanged: (value) =>
              filter.entity = filter.entity.copyWith(propertyType: value),
        ),
      ],
    );
  }
}

class TypeFilterOptionsView extends StatefulWidget {
  const TypeFilterOptionsView({
    Key key,
    @required this.data,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  final List<PropertyTypeEntity> data;
  final PropertyTypeEntity selectedItem;
  final ValueChanged<PropertyTypeEntity> onChanged;

  @override
  _CategoryFilterOptionsViewState createState() =>
      _CategoryFilterOptionsViewState();
}

class _CategoryFilterOptionsViewState extends State<TypeFilterOptionsView> {
  PropertyTypeEntity _selectedItem;
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
          .map<TypeFilterItem>(
            (e) => TypeFilterItem(
              title: e.title,
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? e : null;
                  widget.onChanged(e);
                });
              },
              selected: _selectedItem == e,
            ),
          )
          .toList(),
    );
  }
}

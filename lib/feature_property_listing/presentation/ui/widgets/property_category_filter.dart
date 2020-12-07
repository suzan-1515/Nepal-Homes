import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_category_filter_item.dart';

import 'filter_section_header.dart';

class PropertyCategoryFilter extends StatelessWidget {
  final FilterUIModel filter;

  const PropertyCategoryFilter({
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
        FilterSectionHeader(title: 'Property Category'),
        CategoryFilterOptionsView(
          data: filter.entity.propertyMeta.propertyCategories,
          selectedItem: filter.entity.propertyCategory,
          onChanged: (value) =>
              filter.entity = filter.entity.copyWith(propertyCategory: value),
        ),
      ],
    );
  }
}

class CategoryFilterOptionsView extends StatefulWidget {
  const CategoryFilterOptionsView({
    Key key,
    @required this.data,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  final List<PropertyCategoryEntity> data;
  final PropertyCategoryEntity selectedItem;
  final ValueChanged<PropertyCategoryEntity> onChanged;

  @override
  _CategoryFilterOptionsViewState createState() =>
      _CategoryFilterOptionsViewState();
}

class _CategoryFilterOptionsViewState extends State<CategoryFilterOptionsView> {
  PropertyCategoryEntity _selectedItem;
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
          .map<CategoryFilterItem>(
            (e) => CategoryFilterItem(
              title: e.title,
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? e : null;
                  widget.onChanged(e);
                });
              },
              icon: e.media.fullPath,
              selected: _selectedItem == e,
            ),
          )
          .toList(),
    );
  }
}

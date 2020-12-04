import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_category_filter_item.dart';

import 'filter_section_header.dart';

class PropertyCategoryFilter extends StatelessWidget {
  final FilterUIModel filter;
  static const testData = [
    {'id': '0', 'title': 'Land', 'icon': 'https://picsum.photos/100'},
    {'id': '1', 'title': 'Flats', 'icon': 'https://picsum.photos/100'},
    {'id': '2', 'title': 'Office Space', 'icon': 'https://picsum.photos/100'},
    {'id': '3', 'title': 'Shop Space', 'icon': 'https://picsum.photos/100'},
  ];

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
        const CategoryFilterOptionsView(data: testData),
      ],
    );
  }
}

class CategoryFilterOptionsView extends StatefulWidget {
  const CategoryFilterOptionsView({
    Key key,
    @required this.data,
    this.selected,
  }) : super(key: key);

  final List<Map> data;
  final String selected;

  @override
  _CategoryFilterOptionsViewState createState() =>
      _CategoryFilterOptionsViewState();
}

class _CategoryFilterOptionsViewState extends State<CategoryFilterOptionsView> {
  String _selectedItem;
  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      children: widget.data
          .map<CategoryFilterItem>(
            (e) => CategoryFilterItem(
              title: e['title'],
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? e['id'] : null;
                });
              },
              icon: e['icon'],
              selected: _selectedItem == e['id'],
            ),
          )
          .toList(),
    );
  }
}

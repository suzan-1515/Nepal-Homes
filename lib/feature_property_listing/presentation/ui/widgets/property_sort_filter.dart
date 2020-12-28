import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_category_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_category_filter_item.dart';

import 'filter_section_header.dart';

class PropertySortFilter extends StatelessWidget {
  final FilterUIModel filter;

  const PropertySortFilter({
    Key key,
    @required this.filter,
  }) : super(key: key);

  static const SORT_OPTIONS = [
    'Latest First',
    'Highest Price First',
    'Lowest Price First'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterSectionHeader(title: 'Sort By'),
        SortByFilterOptionsView(
          data: SORT_OPTIONS,
          selectedIndex: (filter.entity.sort ==null) ? 0:filter.entity.sort-1,
          onChanged: (value) => filter.entity =
              filter.entity.copyWith(sort: Nullable<int>(value+1)),
        ),
      ],
    );
  }
}

class SortByFilterOptionsView extends StatefulWidget {
  const SortByFilterOptionsView({
    Key key,
    @required this.data,
    this.selectedIndex,
    this.onChanged,
  }) : super(key: key);

  final List<String> data;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  _SortByFilterOptionsViewState createState() =>
      _SortByFilterOptionsViewState();
}

class _SortByFilterOptionsViewState extends State<SortByFilterOptionsView> {
  int _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(covariant SortByFilterOptionsView oldWidget) {
    if (this._selectedItem != widget.selectedIndex)
      this._selectedItem = widget.selectedIndex;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        value: _selectedItem,
        items: widget.data
            .map(
              (e) => DropdownMenuItem<int>(
                child: Text(e),
                value: widget.data.indexOf(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
            widget.onChanged(value);
          });
        },
      ),
    );
  }
}

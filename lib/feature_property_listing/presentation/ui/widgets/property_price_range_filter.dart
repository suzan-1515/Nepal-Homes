import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_price_range_filter_item.dart';

import 'filter_section_header.dart';

class PropertyPriceRangeFilter extends StatefulWidget {
  final FilterUIModel filter;

  const PropertyPriceRangeFilter({
    Key key,
    @required this.filter,
  }) : super(key: key);

  @override
  _PropertyPriceRangeFilterState createState() =>
      _PropertyPriceRangeFilterState();
}

class _PropertyPriceRangeFilterState extends State<PropertyPriceRangeFilter> {
  final _priceRangeData = [
    'All',
    'Up to 50K',
    '50K to 5 Lakh',
    '5 Lakh to 50 Lakh',
    '50 Lakh to 3 Cr.',
    '3 Cr. to Max'
  ];

  double _currentRangeValue = 0;
  @override
  void initState() {
    super.initState();
    _currentRangeValue = widget.filter.entity.priceRange == null
        ? 0
        : (widget.filter.entity.priceRange).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterSectionHeader(title: 'Price Range'),
            SizedBox(width: 8.0),
            Text(
              _priceRangeData[_currentRangeValue.toInt()],
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        PriceRangeFilterItem(
          labels: _priceRangeData,
          onChanged: (double value) {
            setState(() {
              _currentRangeValue = value;
              int range = value.toInt();
              widget.filter.entity = widget.filter.entity.copyWith(
                  priceRange: Nullable<int>(range == 0 ? null : range));
            });
          },
          value: _currentRangeValue,
        ),
      ],
    );
  }
}

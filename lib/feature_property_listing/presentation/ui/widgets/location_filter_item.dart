import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_entity.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class LocationFilterItem extends StatefulWidget {
  final List<Location> data;
  final Location value;
  final ValueChanged<Location> onChanged;
  final VoidCallback onClear;
  const LocationFilterItem({
    Key key,
    @required this.data,
    @required this.value,
    this.onChanged,
    this.onClear,
  }) : super(key: key);
  @override
  _LocationFilterItemState createState() => _LocationFilterItemState();
}

class _LocationFilterItemState extends State<LocationFilterItem> {
  Equatable _currentValue;
  @override
  void initState() {
    super.initState();
    _currentValue = this.widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SearchableDropdown.single(
      items: this
          .widget
          .data
          .map<DropdownMenuItem<Location>>(
            (e) => DropdownMenuItem<Location>(
              child: Text(e.name),
              value: e,
            ),
          )
          .toList(),
      hint: "Select location",
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.onChanged(value);
        });
      },
      onClear: () => widget.onClear(),
      searchFn: (String keyword, List<DropdownMenuItem<Location>> items) =>
          items
              .where((element) => element.value.name
                  .toLowerCase()
                  .startsWith(keyword.toLowerCase()))
              .map((e) => items.indexOf(e))
              .toList(),
      dialogBox: true,
      isExpanded: true,
      // menuConstraints: BoxConstraints.tight(Size.fromHeight(250)),
    );
  }
}

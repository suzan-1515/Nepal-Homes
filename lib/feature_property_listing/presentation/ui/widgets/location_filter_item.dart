import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class LocationFilterItem extends StatefulWidget {
  final List<String> data;
  final String value;
  const LocationFilterItem({
    Key key,
    @required this.data,
    @required this.value,
  }) : super(key: key);
  @override
  _LocationFilterItemState createState() => _LocationFilterItemState();
}

class _LocationFilterItemState extends State<LocationFilterItem> {
  String _currentValue;
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
          .map<DropdownMenuItem>(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      hint: "Select location",
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
        });
      },
      dialogBox: false,
      isExpanded: true,
      menuConstraints: BoxConstraints.tight(Size.fromHeight(250)),
    );
  }
}

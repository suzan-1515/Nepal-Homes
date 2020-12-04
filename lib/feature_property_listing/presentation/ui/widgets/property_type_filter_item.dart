import 'package:flutter/material.dart';

class TypeFilterItem extends StatefulWidget {
  final List<String> data;
  final String selected;

  const TypeFilterItem({
    Key key,
    @required this.data,
    @required this.selected,
  }) : super(key: key);

  @override
  _TypeFilterItemState createState() => _TypeFilterItemState();
}

class _TypeFilterItemState extends State<TypeFilterItem> {
  String _selected;
  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      children: widget.data
          .map<InputChip>(
            (e) => InputChip(
              selected: this._selected == e,
              onSelected: (value) {
                setState(() {
                  this._selected = value ? e : null;
                });
              },
              selectedColor: theme.primaryColor.withOpacity(0.2),
              // onPressed: widget.onTap,
              avatar: _selected == e
                  ? null
                  : SizedBox(
                      width: 10,
                      height: 10,
                      child: CircleAvatar(
                        backgroundColor: theme.primaryColor,
                      ),
                    ),
              label: Text(
                e,
                style: theme.textTheme.button.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              backgroundColor: theme.primaryColor.withOpacity(0.05),
            ),
          )
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';

class PremiumFilterItem extends StatefulWidget {
  final String title;
  final ValueChanged<bool> onChanged;
  final bool value;

  const PremiumFilterItem(
      {Key key,
      @required this.title,
      @required this.onChanged,
      @required this.value})
      : super(key: key);

  @override
  _PremiumFilterItemState createState() => _PremiumFilterItemState();
}

class _PremiumFilterItemState extends State<PremiumFilterItem> {
  bool _value;
  @override
  void initState() {
    super.initState();
    this._value = widget.value;
  }

  @override
  void didUpdateWidget(covariant PremiumFilterItem oldWidget) {
    this._value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(width: 8),
        Checkbox(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                widget.onChanged(value);
              });
            }),
      ],
    );
  }
}

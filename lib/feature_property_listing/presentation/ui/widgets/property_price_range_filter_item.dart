import 'package:flutter/material.dart';

class PriceRangeFilterItem extends StatelessWidget {
  final ValueChanged<double> onChanged;
  final double value;
  final List<String> labels;

  const PriceRangeFilterItem({
    Key key,
    @required this.onChanged,
    @required this.value,
    @required this.labels,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 0,
      max: (labels.length - 1).toDouble(),
      divisions: (labels.length - 1),
      label: labels[value.toInt()],
      onChanged: onChanged,
    );
  }
}

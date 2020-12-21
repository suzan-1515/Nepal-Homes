import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  const BorderedContainer({Key key, this.child, this.padding, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
            width: 0.3, color: Theme.of(context).dividerColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: child,
    );
  }
}

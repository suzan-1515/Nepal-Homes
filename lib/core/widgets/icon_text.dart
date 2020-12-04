import 'package:flutter/cupertino.dart';

class IconText extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final double spacing;

  const IconText(
      {Key key, @required this.label, @required this.icon, this.spacing = 4})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(width: spacing),
        Flexible(child: label),
      ],
    );
  }
}

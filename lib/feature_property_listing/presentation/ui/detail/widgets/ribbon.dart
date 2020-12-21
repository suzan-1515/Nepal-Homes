import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/ribbon_container.dart';

class Ribbon extends StatelessWidget {
  const Ribbon({
    Key key,
    @required this.title,
    this.color,
    this.icon,
  }) : super(key: key);

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RibbonContainer(
      color: color ?? theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(width: 4),
          Text(
            title,
            style: theme.textTheme.caption
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

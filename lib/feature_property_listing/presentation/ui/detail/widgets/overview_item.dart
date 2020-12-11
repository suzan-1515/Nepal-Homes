import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {
  final IconData icon;
  final double spacing;
  final String title;
  final String value;

  const OverviewItem(
      {Key key,
      @required this.icon,
      this.spacing = 8.0,
      @required this.title,
      @required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 32,
          color: Color.fromARGB(255, 145, 152, 161),
        ),
        SizedBox(width: spacing),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyText2.copyWith(
                color: Color.fromARGB(255, 145, 152, 161),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              value,
              style: theme.textTheme.subtitle2.copyWith(
                  color: Color.fromARGB(255, 47, 57, 72),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}

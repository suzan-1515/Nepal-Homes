import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildingStatItem extends StatelessWidget {
  final Icon icon;
  final String count;
  final String title;
  final Color titleColor;
  final Color valueColor;
  final double titleSpacing;
  final double valueSpacing;

  const BuildingStatItem(
      {Key key,
      @required this.icon,
      @required this.count,
      @required this.title,
      this.titleColor = const Color.fromARGB(255, 145, 152, 161),
      this.valueColor = const Color.fromARGB(255, 47, 57, 72),
      this.titleSpacing = 4.0,
      this.valueSpacing = 8.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(
              width: this.valueSpacing,
            ),
            Flexible(
              child: Text(
                this.count ?? 'N/A',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: this.valueColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: this.titleSpacing),
        Text(
          this.title,
          maxLines: 1,
          style: theme.textTheme.bodyText2.copyWith(color: this.titleColor),
        )
      ],
    );
  }
}

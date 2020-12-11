import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class AmenityItem extends StatelessWidget {
  final String icon;
  final double spacing;
  final String title;

  const AmenityItem({
    Key key,
    @required this.icon,
    this.spacing = 8.0,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedImage(
          icon,
          width: 32,
          height: 32,
          color: Color.fromARGB(255, 145, 152, 161),
        ),
        SizedBox(width: spacing),
        Flexible(
          child: Text(
            title,
            style: theme.textTheme.subtitle2.copyWith(
              color: Color.fromARGB(255, 47, 57, 72),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

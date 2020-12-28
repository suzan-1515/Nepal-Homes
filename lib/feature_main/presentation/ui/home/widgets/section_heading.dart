import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllTap;

  const SectionHeading(
      {Key key, @required this.title, this.onViewAllTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.subtitle1.copyWith(
              color: Color.fromARGB(255, 47, 57, 72),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (onViewAllTap != null) ...[
          SizedBox(width: 8),
          FlatButton(
            visualDensity: VisualDensity.compact,
            child: Text(
              'View All',
              style: theme.textTheme.button.copyWith(color: theme.primaryColor),
            ),
            onPressed: onViewAllTap,
          ),
        ],
      ],
    );
  }
}

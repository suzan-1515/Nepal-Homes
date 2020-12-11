import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.subtitle1.copyWith(
        fontWeight: FontWeight.w700,
        color: theme.textTheme.subtitle1.color.withOpacity(0.7),
      ),
    );
  }
}

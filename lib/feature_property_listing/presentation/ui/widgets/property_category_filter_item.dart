import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class CategoryFilterItem extends StatelessWidget {
  final String title;
  final String icon;
  final ValueChanged<bool> onTap;
  final Color color;
  final bool selected;

  const CategoryFilterItem(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.onTap,
      this.color,
      this.selected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InputChip(
      selected: selected,
      onSelected: onTap,
      avatar: selected
          ? null
          : CircleAvatar(
              backgroundImage: AdvancedNetworkImage(icon),
              backgroundColor: theme.highlightColor,
            ),
      label: Text(
        title,
        style: theme.textTheme.button.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      selectedColor: theme.primaryColor.withOpacity(0.3),
      backgroundColor: color ?? theme.primaryColor.withOpacity(0.05),
    );
  }
}

import 'package:flutter/material.dart';

class RoadTypeFilterItem extends StatelessWidget {
  final String title;
  final ValueChanged<bool> onTap;
  final Color color;
  final bool selected;

  const RoadTypeFilterItem(
      {Key key,
      @required this.title,
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
      selectedColor: theme.primaryColor.withOpacity(0.2),
      avatar: selected
          ? null
          : SizedBox(
              width: 10,
              height: 10,
              child: CircleAvatar(
                backgroundColor: theme.primaryColor,
              ),
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
      backgroundColor: theme.primaryColor.withOpacity(0.05),
    );
  }
}

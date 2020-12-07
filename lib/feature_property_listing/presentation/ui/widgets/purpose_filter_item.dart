import 'package:flutter/material.dart';

class PurposeFilterItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final ValueChanged<bool> onTap;
  final Color color;
  final bool selected;

  const PurposeFilterItem({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
    this.color,
    @required this.selected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(selected),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Theme.of(context).primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 16.0),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

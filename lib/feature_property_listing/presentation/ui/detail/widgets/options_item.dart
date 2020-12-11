import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/shade_icon.dart';

class OptionsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final double spacing;
  final VoidCallback onTap;

  const OptionsItem(
      {Key key,
      @required this.title,
      @required this.icon,
      this.spacing = 4.0,
      @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadeIcon(
          icon: Icon(icon),
          onTap: onTap,
          shadeColor: Colors.grey.shade200,
        ),
        SizedBox(
          height: spacing,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}

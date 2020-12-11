import 'package:flutter/material.dart';

class ShadeIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color shadeColor;
  final double shadeRadius;
  final Widget icon;
  const ShadeIcon({
    Key key,
    this.onTap,
    this.shadeColor,
    this.shadeRadius = 6.0,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(shadeRadius),
            color: shadeColor ?? Colors.grey.withOpacity(0.5)),
        child: icon,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'ribbon_clipper.dart';

class RibbonContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Alignment alignment;

  const RibbonContainer(
      {Key key,
      this.color,
      @required this.child,
      this.width,
      this.height,
      this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      this.alignment = Alignment.center})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RibbonClipper(),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(right: 15.0),
        color: color,
        child: Padding(
          padding: padding,
          child: Align(
            alignment: alignment,
            child: child,
          ),
        ),
      ),
    );
  }
}

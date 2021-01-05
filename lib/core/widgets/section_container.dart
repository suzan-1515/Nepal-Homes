import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget heading;
  final Widget content;

  const SectionContainer(
      {Key key, @required this.heading, @required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heading,
        SizedBox(height: 16),
        content,
      ],
    );
  }
}

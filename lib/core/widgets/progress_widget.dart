import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  const ProgressView();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: .7,
      ),
    );
  }
}

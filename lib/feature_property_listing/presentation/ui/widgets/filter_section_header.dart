import 'package:flutter/material.dart';

class FilterSectionHeader extends StatelessWidget {
  final String title;

  const FilterSectionHeader({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Color.fromARGB(255, 47, 57, 72),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

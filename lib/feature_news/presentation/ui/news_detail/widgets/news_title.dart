import 'package:flutter/material.dart';

class NewsTitle extends StatelessWidget {
  final String title;

  const NewsTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title ?? 'N/A',
        style: Theme.of(context).textTheme.headline5.copyWith(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 47, 57, 72)));
  }
}

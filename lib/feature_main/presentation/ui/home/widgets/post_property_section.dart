import 'dart:ui';

import 'package:flutter/material.dart';

class PostPropertySection extends StatelessWidget {
  const PostPropertySection();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        // color: theme.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.primaryColor,
            theme.accentColor.withOpacity(0.7),
          ],
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'List Property For Free',
            style: theme.textTheme.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Fill up your property details and sell without any hassle.',
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white60),
          ),
          SizedBox(height: 16.0),
          OutlineButton(
            child: Text(
              'Post Property',
              style: theme.textTheme.button.copyWith(color: Colors.white),
            ),
            onPressed: () {},
            color: theme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

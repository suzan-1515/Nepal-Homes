import 'dart:ui';

import 'package:flutter/material.dart';

class RequestPropertySection extends StatelessWidget {
  const RequestPropertySection();
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
            theme.accentColor,
            theme.primaryColor,
          ],
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '0% commission in property deals',
            style: theme.textTheme.subtitle1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Tell us your requirements and get matching properties from sellers, agencies, developers',
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white60),
          ),
          SizedBox(height: 16.0),
          OutlineButton(
            child: Text(
              'Request Property',
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

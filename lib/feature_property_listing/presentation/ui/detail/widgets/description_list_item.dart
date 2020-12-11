import 'package:flutter/material.dart';

class DescriptionListItem extends StatelessWidget {
  const DescriptionListItem({
    Key key,
    @required this.indicatorText,
    @required this.text,
    this.textStyle,
    this.indicatorTextStyle,
  }) : super(key: key);

  final String indicatorText;
  final String text;
  final TextStyle textStyle;
  final TextStyle indicatorTextStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: theme.primaryColor),
            child: Text(
              indicatorText,
              style: indicatorTextStyle ??
                  theme.textTheme.overline.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: SelectableText(
              text,
              style: textStyle ??
                  theme.textTheme.bodyText2
                      .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
            ),
          ),
        ],
      ),
    );
  }
}

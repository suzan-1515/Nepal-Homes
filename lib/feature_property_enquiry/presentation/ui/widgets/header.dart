import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PropertyEnquiryHeader extends StatelessWidget {
  const PropertyEnquiryHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Contact',
          style: theme.textTheme.subtitle1.copyWith(
            color: Color.fromARGB(255, 47, 57, 72),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(LineAwesomeIcons.times),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

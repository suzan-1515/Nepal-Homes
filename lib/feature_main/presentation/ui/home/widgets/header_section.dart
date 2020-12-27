import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_banner.jpg'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Find Your Dream Home',
            style: theme.textTheme.headline6.copyWith(
                color: theme.accentColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Text(
            NepaliDateFormat("yyyy MMMM d, EEE").format(NepaliDateTime.now()),
            style: theme.textTheme.subtitle2,
          ),
          const SizedBox(height: 4.0),
          Text(
            'Good Morning,',
            style:
                theme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Stranger',
              style: theme.textTheme.subtitle1
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}

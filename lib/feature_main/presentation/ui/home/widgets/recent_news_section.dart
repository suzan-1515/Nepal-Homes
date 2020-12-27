import 'package:flutter/material.dart';

import 'section_container.dart';
import 'section_heading.dart';

class RecentNewsSection extends StatelessWidget {
  const RecentNewsSection();
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      heading: SectionHeading(
        title: 'Recent News',
        onViewAllTap: () {},
      ),
      content: Placeholder(
        fallbackHeight: 100,
      ),
    );
  }
}

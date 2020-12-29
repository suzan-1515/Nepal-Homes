import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_main/presentation/ui/home/widgets/section_heading.dart';

import 'section_container.dart';

class LoanProcessSection extends StatelessWidget {
  const LoanProcessSection();

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      heading: SectionHeading(
        title: 'Loan Process',
        onViewAllTap: () {},
      ),
      content: Placeholder(
        fallbackHeight: 100,
      ),
    );
  }
}

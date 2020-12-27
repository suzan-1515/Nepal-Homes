import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';

import 'section_container.dart';
import 'section_heading.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection();
  @override
  Widget build(BuildContext context) {
    return PropertyProvider.hotPropertyBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Explore NepalHomes',
          onViewAllTap: () {},
        ),
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(
              10,
              (x) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                width: 100,
                height: 80,
                alignment: Alignment.center,
                child: Text(
                  x.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

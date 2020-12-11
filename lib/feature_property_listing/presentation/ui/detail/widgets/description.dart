import 'package:html/parser.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';

import 'description_list_item.dart';

class Description extends StatelessWidget {
  const Description();

  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
    final listTextStyle = theme.textTheme.bodyText2
        .copyWith(color: Color.fromARGB(255, 145, 152, 161));
    final listIndicatorTextStyle =
        theme.textTheme.overline.copyWith(color: Colors.white);
    return FadeInUp(
      duration: const Duration(milliseconds: 200),
      child: BorderedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionHeader(title: 'Description'),
            SizedBox(height: 4),
            ...parse(property.entity.basic.description)
                .querySelectorAll('ul')
                .map<List<Widget>>((e) {
                  return <Widget>[SizedBox(height: 16.0)] +
                      e
                          .querySelectorAll('li')
                          .asMap()
                          .map<int, Widget>(
                            (index, e) => MapEntry(
                              index,
                              DescriptionListItem(
                                indicatorText: '${index + 1}',
                                text: e.text.trim(),
                                indicatorTextStyle: listIndicatorTextStyle,
                                textStyle: listTextStyle,
                              ),
                            ),
                          )
                          .values
                          .toList();
                })
                .expand((element) => element)
                .toList(),
          ],
        ),
      ),
    );
  }
}

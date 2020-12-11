import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/options_item.dart';

class OptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionsItem(
            title: 'Map View', icon: LineAwesomeIcons.map, onTap: () {}),
        OptionsItem(title: 'Near By', icon: LineAwesomeIcons.eye, onTap: () {}),
        OptionsItem(
            title: 'Stats', icon: LineAwesomeIcons.bar_chart, onTap: () {}),
      ],
    );
  }
}

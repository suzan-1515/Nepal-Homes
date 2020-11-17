import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nepal_homes/feature_main/presentation/ui/settings/widgets/about_settings.dart';
import 'package:nepal_homes/feature_main/presentation/ui/settings/widgets/section_heading.dart';
import 'package:nepal_homes/feature_main/presentation/ui/settings/widgets/theme_settings.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SectionHeading(
            title: 'App Theme',
            icon: FontAwesomeIcons.adjust,
          ),
          ThemeSettings(context: context),
          SizedBox(height: 16),
          SectionHeading(
            title: 'About',
            icon: FontAwesomeIcons.infoCircle,
          ),
          AboutSettings(context: context),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

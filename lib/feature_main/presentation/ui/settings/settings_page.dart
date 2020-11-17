import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_main/presentation/ui/settings/widgets/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const SettingsList(),
        ),
      ),
    );
  }
}

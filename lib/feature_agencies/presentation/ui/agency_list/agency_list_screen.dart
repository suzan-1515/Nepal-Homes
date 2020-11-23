import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/widgets/agency_list.dart';
import 'package:nepal_homes/feature_agencies/utils/provider.dart';

class AgencyListScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/agencies';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AgencyProvider.agencyBlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Agencies',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const AgencyList(),
          ),
        ),
      ),
    );
  }
}

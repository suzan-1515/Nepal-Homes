import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/list/widgets/property_list.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/filter_view.dart';
import 'package:nepal_homes/feature_property_listing/utils/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PropertyProvider.propertyBlocProvider(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search properties',
              prefixIcon: Icon(LineAwesomeIcons.search),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(LineAwesomeIcons.filter),
              onPressed: () => showDialog(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Filters',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).textTheme.headline6.color),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(LineAwesomeIcons.times),
                      onPressed: () => Navigator.pop(context),
                    ),
                    automaticallyImplyLeading: false,
                  ),
                  body: ScopedModel<FilterUIModel>(
                    model: FilterUIModel(null),
                    child: FilterView(),
                  ),
                  floatingActionButton: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: Text('Apply Filters'),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(6.0)),
                    icon: Icon(LineAwesomeIcons.filter),
                  ),
                ),
                context: context,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const PropertyList(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

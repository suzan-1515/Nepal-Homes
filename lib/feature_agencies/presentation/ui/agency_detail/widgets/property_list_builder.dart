import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/property_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyListBuilder extends StatelessWidget {
  final List<PropertyUIModel> data;

  const PropertyListBuilder({@required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final e = data[index];
        return ScopedModel<PropertyUIModel>(
          model: e,
          child: const PropertyListItem(),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AddressView extends StatelessWidget {
  const AddressView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    return IconText(
        label: Text(
          '${property.entity.address.area.name}, ${property.entity.address.city.name}',
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
        ),
        icon: Icon(
          LineAwesomeIcons.map_marker,
          size: 16,
          color: Color.fromARGB(255, 145, 152, 161),
        ));
  }
}

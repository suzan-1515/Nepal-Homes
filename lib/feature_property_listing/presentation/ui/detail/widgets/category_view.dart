import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${property.entity.basic.propertyCategory.title.toUpperCase()} • ${DateFormat('dd MMM, yyyy').format(property.entity.addedAt)}',
          maxLines: 2,
          style: theme.textTheme.subtitle2
              .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
        ),
        const SizedBox(width: 8.0),
        Chip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(0.0),
          visualDensity: VisualDensity.compact,
          backgroundColor: Color.fromARGB(255, 143, 216, 160),
          label: Text(
            '${property.entity.basic.propertyPurpose.title.toUpperCase()}',
          ),
          labelStyle: Theme.of(context).textTheme.overline.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ],
    );
  }
}

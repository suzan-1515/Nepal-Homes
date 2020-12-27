import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

class PriceView extends StatelessWidget {
  const PriceView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    final theme = Theme.of(context);
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: property.entity.price.resolvedPrice ?? 'N/A',
          style: theme.textTheme.headline6.copyWith(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 47, 57, 72)),
          children: [
            TextSpan(
                text:
                    ' ${(property.entity.price.isPriceOnCall ?? true) ? '' : property.entity.price.label.title}',
                style: theme.textTheme.caption),
          ]),
    );
  }
}

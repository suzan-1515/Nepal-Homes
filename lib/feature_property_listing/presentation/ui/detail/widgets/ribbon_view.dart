import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'ribbon.dart';

class RibbonView extends StatelessWidget {
  const RibbonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (property.entity.isExclusive) ...[
          Image.asset(
            'assets/images/exclusive.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8.0)
        ],
        if (property.entity.isPremium) ...[
          const Ribbon(
            title: 'Premium',
            icon: LineAwesomeIcons.certificate,
            color: Colors.deepPurple,
          ),
          const SizedBox(width: 8.0)
        ],
        if (property.entity.isFeatured) ...[
          const Ribbon(
              title: 'Featured',
              icon: LineAwesomeIcons.check_circle,
              color: Colors.deepOrange),
          const SizedBox(width: 8.0)
        ],
        if (property.entity.isVerified) ...[
          const Ribbon(
            title: 'Verified',
            icon: LineAwesomeIcons.check_circle,
          ),
          const SizedBox(width: 8.0)
        ],
      ],
    );
  }
}

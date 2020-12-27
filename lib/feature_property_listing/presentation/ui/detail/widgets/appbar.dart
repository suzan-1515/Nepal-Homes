import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'image_carousel.dart';

class DetailSliverAppbar extends StatelessWidget {
  const DetailSliverAppbar({
    Key key,
    this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      title: isCollapsed
          ? SlideInUp(
              duration: const Duration(milliseconds: 200),
              child: Text(
                '${(property.entity.price.isPriceOnCall ?? true) ? 'Price on Call' : property.entity.price.formattedValue()}',
                style: theme.textTheme.subtitle1,
              ),
            )
          : null,
      leading: IconButton(
        icon: Icon(
          LineAwesomeIcons.angle_left,
          color: isCollapsed ? null : theme.backgroundColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            LineAwesomeIcons.heart_1,
            color: isCollapsed ? null : theme.backgroundColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            LineAwesomeIcons.share,
            color: isCollapsed ? null : theme.backgroundColor,
          ),
          onPressed: () {},
        ),
      ],
      expandedHeight: size.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: DetailImageCarousel(
            images: property.entity.media?.images
                    ?.map((e) => e.fullPath)
                    ?.toList() ??
                List<String>.empty()),
      ),
    );
  }
}

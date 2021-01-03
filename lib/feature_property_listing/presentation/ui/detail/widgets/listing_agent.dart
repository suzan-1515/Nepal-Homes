
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';

class ListingAgent extends StatelessWidget {
  const ListingAgent();

  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
    final agent = property.entity.agent ==null?property.entity.addedBy:property.entity.agent;
    return BorderedContainer(
      color: theme.primaryColor.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(title: 'Listing Agent'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    agent?.image?.fullPath ?? APIUrlConstants.DEFAULT_IMAGE_URL),
                backgroundColor: theme.highlightColor,
                radius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agent?.name ?? 'N/A',
                      style: theme.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 47, 57, 72)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      property.entity.agency?.title ?? 'N/A',
                      style: theme.textTheme.bodyText2
                          .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              RawMaterialButton(
                padding: const EdgeInsets.all(0.0),
                elevation: 2.0,
                child: Icon(
                  LineAwesomeIcons.phone,
                  color: theme.primaryColor,
                  size: 18,
                ),
                onPressed: () {},
                constraints: BoxConstraints.tightFor(
                  width: 48.0,
                  height: 48.0,
                ),
                shape: CircleBorder(),
                fillColor: theme.backgroundColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

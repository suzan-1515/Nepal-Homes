import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyInfo extends StatelessWidget {
  const AgencyInfo();

  @override
  Widget build(BuildContext context) {
    final agency =
        ScopedModel.of<AgencyDetailUIModel>(context, rebuildOnChange: true);
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner.png'),
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(4.0),
              width: size.width * .30,
              height: size.width * .30,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(90.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        agency.entity.agency.logo?.fullPath ??
                            APIUrlConstants.DEFAULT_IMAGE_URL)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).highlightColor.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  agency.entity.agency.title,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12.0),
              IconText(
                  label: Text(
                    agency.entity.agency.address,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  icon: Icon(
                    LineAwesomeIcons.map_marker,
                    size: 16,
                  )),
              const SizedBox(height: 8.0),
              IconText(
                  label: Text(
                    agency.entity.agency.email,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  icon: Icon(
                    LineAwesomeIcons.envelope,
                    size: 16,
                  )),
              const SizedBox(height: 8.0),
              IconText(
                label: Text(
                  agency.entity.agency.mobile,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                icon: Icon(
                  LineAwesomeIcons.phone,
                  size: 16,
                ),
              ),
              const SizedBox(height: 8.0),
              IconText(
                label: Text(
                  agency.entity.agency.website,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                icon: Icon(
                  LineAwesomeIcons.globe,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

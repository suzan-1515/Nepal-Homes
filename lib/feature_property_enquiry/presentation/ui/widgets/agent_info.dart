import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';

class AgentInfo extends StatelessWidget {
  const AgentInfo({
    Key key,
    @required this.agentName,
    @required this.agentAvatar,
    @required this.agencyName,
    @required this.agentContact,
    @required this.propertyId,
    @required this.propertyCode,
  }) : super(key: key);

  final String agentName;
  final String agentAvatar;
  final String agencyName;
  final String agentContact;
  final String propertyId;
  final String propertyCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BorderedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                agentAvatar ?? APIUrlConstants.DEFAULT_IMAGE_URL),
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
                  agentName ?? 'N/A',
                  style: theme.textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 57, 72)),
                ),
                if (agencyName != null && agencyName.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Text(
                    agencyName ?? 'N/A',
                    style: theme.textTheme.bodyText2
                        .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                  ),
                ],
                if (agentContact != null && agentContact.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Text(
                    agentContact ?? 'N/A',
                    style: theme.textTheme.bodyText2
                        .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: 8),
          if (agentContact != null && agentContact.isNotEmpty)
            RawMaterialButton(
              padding: const EdgeInsets.all(0.0),
              elevation: 2.0,
              child: Icon(
                LineAwesomeIcons.phone,
                color: theme.primaryColor,
                size: 18,
              ),
              onPressed: () => LinkUtils.openLink('tel:$agentContact'),
              constraints: BoxConstraints.tightFor(
                width: 48.0,
                height: 48.0,
              ),
              shape: CircleBorder(),
              fillColor: theme.backgroundColor,
            ),
        ],
      ),
    );
  }
}

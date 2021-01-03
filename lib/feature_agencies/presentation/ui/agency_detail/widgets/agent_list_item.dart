import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AgentListItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String email;
  final String contact;

  const AgentListItem({
    Key key,
    @required this.avatar,
    @required this.title,
    @required this.email,
    @required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyText2
        .copyWith(color: theme.textTheme.bodyText2.color.withOpacity(0.5));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatar),
            radius: 40,
          ),
          const SizedBox(height: 8.0),
          Flexible(
            child: Text(
              '$title',
              maxLines: 2,
              style: theme.textTheme.bodyText1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          Flexible(
            child: Text(
              '$email',
              maxLines: 2,
              style: textStyle,
            ),
          ),
          Flexible(
            child: Text(
              '$contact',
              maxLines: 2,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}

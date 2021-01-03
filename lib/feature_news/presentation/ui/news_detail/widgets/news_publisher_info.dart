import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/feature_news/domain/entities/author_entity.dart';

class PublisherInfo extends StatelessWidget {
  final AuthorEntity author;
  final String publishedDate;

  const PublisherInfo(
      {Key key, @required this.author, @required this.publishedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: CachedNetworkImageProvider(
            author?.image?.fullPath ?? APIUrlConstants.DEFAULT_IMAGE_URL,
          ),
          backgroundColor: theme.highlightColor,
        ),
        const SizedBox(width: 8),
        Text.rich(
          TextSpan(
              text: author?.name ?? 'N/A',
              style: theme.textTheme.subtitle1,
              children: [
                TextSpan(
                    text: '\n$publishedDate', style: theme.textTheme.caption),
              ]),
        ),
      ],
    );
  }
}

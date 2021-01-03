import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/feature_news/domain/entities/author_entity.dart';

class NewsAuthor extends StatelessWidget {
  final AuthorEntity author;

  const NewsAuthor({Key key, @required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 6,
            color: theme.primaryColor,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: CachedNetworkImageProvider(
              author?.image?.fullPath ?? APIUrlConstants.DEFAULT_IMAGE_URL,
            ),
            backgroundColor: theme.highlightColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author?.name ?? 'N/A',
                  style: theme.textTheme.subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  author?.bio ?? '',
                  style: theme.textTheme.bodyText2
                      .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                ),
                const SizedBox(height: 16),
                OutlineButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Read more from author',
                    style: theme.textTheme.button
                        .copyWith(color: theme.accentColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

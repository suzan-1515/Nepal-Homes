import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class NewsListItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String date;
  final String description;
  final VoidCallback onTap;
  final Size imageSize;

  const NewsListItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.date,
    @required this.description,
    @required this.onTap,
    this.imageSize = const Size(100, 100),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'news-hero-title-$id',
                      child: Text(
                        '${title ?? 'N/A'}',
                        maxLines: 3,
                        style: theme.textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 47, 57, 72)),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${description ?? ''}',
                      maxLines: 3,
                      style: theme.textTheme.bodyText2
                          .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      date,
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedImage(
                  image ?? APIUrlConstants.DEFAULT_IMAGE_URL,
                  fit: BoxFit.cover,
                  tag: image,
                  width: imageSize.width,
                  height: imageSize.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

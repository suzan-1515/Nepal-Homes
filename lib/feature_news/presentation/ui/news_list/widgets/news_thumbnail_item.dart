import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class NewsThumbnailItem extends StatelessWidget {
  const NewsThumbnailItem({
    @required this.image,
    @required this.onTap,
    @required this.title,
    this.author,
    @required this.date,
    this.imageHeight = 200,
    @required this.id,
  });

  final String image;
  final VoidCallback onTap;
  final String title;
  final String author;
  final String date;
  final double imageHeight;
  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              '${title ?? 'N/A'}',
              style: theme.textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 47, 57, 72)),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: imageHeight,
              decoration: BoxDecoration(
                color: theme.highlightColor,
              ),
              child: CachedImage(
                (image == null || image.isEmpty)
                    ? APIUrlConstants.DEFAULT_IMAGE_URL
                    : image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              '${date ?? 'N/A'}',
              maxLines: 1,
              style: theme.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class NewsGridCompactItem extends StatelessWidget {
  const NewsGridCompactItem({
    this.image,
    @required this.onTap,
    this.title,
    this.author,
    this.date,
  });

  final String image;
  final VoidCallback onTap;
  final String title;
  final String author;
  final String date;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
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
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '${title ?? 'N/A'}',
                style: theme.textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 47, 57, 72)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                '${date ?? 'N/A'}',
                maxLines: 1,
                style: theme.textTheme.caption,
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

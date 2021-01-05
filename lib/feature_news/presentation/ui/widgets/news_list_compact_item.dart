import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class NewsListCompactItem extends StatelessWidget {
  final String title;
  final String image;
  final String date;
  final VoidCallback onTap;
  final Size imageSize;

  const NewsListCompactItem({
    Key key,
    @required this.title,
    @required this.image,
    @required this.date,
    @required this.onTap,
    this.imageSize = const Size(100, 100),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedImage(
                image ?? APIUrlConstants.DEFAULT_IMAGE_URL,
                fit: BoxFit.cover,
                width: imageSize.width,
                height: imageSize.height,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${title ?? 'N/A'}',
                    maxLines: 3,
                    style: theme.textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 57, 72)),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    date,
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

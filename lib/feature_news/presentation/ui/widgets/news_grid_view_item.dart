import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

class NewsGridViewItem extends StatelessWidget {
  const NewsGridViewItem(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.propertyCount,
      @required this.onTap})
      : super(key: key);
  final String image;
  final String title;
  final int propertyCount;
  final VoidCallback onTap;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: double.infinity,
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
              Text(
                title ?? 'N/A',
                style: theme.textTheme.subtitle2,
                maxLines: 2,
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                '${propertyCount?.toString() ?? 'N/A'} properties',
                style: theme.textTheme.caption,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

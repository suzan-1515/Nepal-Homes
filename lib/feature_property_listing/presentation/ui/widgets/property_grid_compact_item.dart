import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';

class PropertyGridCompactItem extends StatelessWidget {
  const PropertyGridCompactItem({
    this.image,
    @required this.onTap,
    this.price,
    this.priceLabel,
    this.address,
    this.imageHeight = 100,
  });

  final String image;
  final VoidCallback onTap;
  final String price;
  final String priceLabel;
  final String address;
  final double imageHeight;

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
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: '${price ?? 'N/A'}',
                    style: theme.textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 57, 72)),
                    children: [
                      TextSpan(
                          text: ' ${priceLabel ?? ''}',
                          style: theme.textTheme.caption),
                    ]),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: IconText(
                  label: Text(
                    '${address ?? 'N/A'}',
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                  ),
                  icon: Icon(
                    LineAwesomeIcons.map_marker,
                    size: 16,
                    color: Color.fromARGB(255, 145, 152, 161),
                  )),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

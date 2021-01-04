import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/gallery_view_screen.dart';

class CoverImage extends StatelessWidget {
  final String image;
  final double imageHeight;

  const CoverImage({Key key, @required this.image, this.imageHeight = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        GalleryViewScreen.ROUTE,
        arguments: GalleryViewScreenArgs(images: [image]),
      ),
      child: CachedImage(
        image ?? APIUrlConstants.DEFAULT_IMAGE_URL,
        height: imageHeight,
        tag: image ?? UniqueKey(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  CachedImage(this.imageURL,
      {this.tag, this.fit = BoxFit.cover, this.width, this.height, this.color});

  final String imageURL;
  final String tag;
  final BoxFit fit;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? UniqueKey(),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: imageURL ?? '',
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
              Icon(FontAwesomeIcons.image, size: 16),
            ],
          ),
        ),
        errorWidget: (context, url, error) => Opacity(
          opacity: 0.45,
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey[500],
            child: Icon(FontAwesomeIcons.image, size: 32),
          ),
        ),
        color: color,
      ),
    );
  }
}

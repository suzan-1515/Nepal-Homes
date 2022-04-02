import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/gallery_view_screen.dart';

class NewsDescription extends StatefulWidget {
  final String description;

  const NewsDescription({Key key, @required this.description})
      : super(key: key);

  @override
  _NewsDescriptionState createState() => _NewsDescriptionState();
}

class _NewsDescriptionState extends State<NewsDescription> {
  @override
  Widget build(BuildContext context) {
    final border = Border.all(width: 0.5);
    final borderSide = BorderSide(width: 0.5);
    final textStyle = Theme.of(context).textTheme.subtitle1;
    return Html(
      data: widget.description,
      style: {
        "table": Style(
          border: border,
        ),
        "tr": Style(border: Border.symmetric(horizontal: borderSide)),
        "td": Style(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          border: Border.symmetric(vertical: borderSide),
        ),
        "p": Style(
          fontFamily: textStyle.fontFamily,
          fontWeight: textStyle.fontWeight,
          fontStyle: textStyle.fontStyle,
          fontSize: FontSize(textStyle.fontSize),
          wordSpacing: textStyle.wordSpacing,
          letterSpacing: textStyle.letterSpacing,
        ),
      },
      onImageTap: (String url, RenderContext c, Map<String, String> attributes,
              dom.Element element) =>
          Navigator.pushNamed(
        context,
        GalleryViewScreen.ROUTE,
        arguments: GalleryViewScreenArgs(images: [url]),
      ),
      onLinkTap: (String url, RenderContext c, Map<String, String> attributes,
              dom.Element element) =>
          LinkUtils.openLink(url),
    );
  }
}

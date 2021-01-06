import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/gallery_view_screen.dart';

class DetailImageCarousel extends StatefulWidget {
  const DetailImageCarousel({
    Key key,
    @required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  _DetailImageCarouselState createState() => _DetailImageCarouselState();
}

class _DetailImageCarouselState extends State<DetailImageCarousel> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void dispose() {
    _currentIndex?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, GalleryViewScreen.ROUTE,
                  arguments: GalleryViewScreenArgs(
                      images: widget.images,
                      currentIndex: _currentIndex.value)),
              child: PageView(
                children: widget.images
                    ?.map((e) => CachedImage(
                          e,
                          tag: e,
                        ))
                    ?.toList(),
                onPageChanged: (value) {
                  _currentIndex.value = value;
                },
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.black54,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LineAwesomeIcons.images,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${value + 1} \\ ${widget.images.length}',
                        style: theme.textTheme.caption.copyWith(
                          color: theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

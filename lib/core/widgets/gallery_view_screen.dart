import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryViewScreen extends StatefulWidget {
  static const String ROUTE = '/gallery';

  const GalleryViewScreen({Key key}) : super(key: key);

  @override
  _GalleryViewScreenState createState() => _GalleryViewScreenState();
}

class _GalleryViewScreenState extends State<GalleryViewScreen> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  var _pageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final GalleryViewScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    _pageController = PageController(initialPage: args.currentIndex);
    _currentIndex.value = args.currentIndex;
  }

  @override
  void dispose() {
    _currentIndex?.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GalleryViewScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.subtitle1.color);
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, value, child) => Text(
            '${_currentIndex.value + 1} \\ ${args.images.length}',
            style: titleStyle,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            pageController: _pageController,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                imageProvider: CachedNetworkImageProvider(args.images[index]),
                heroAttributes:
                    PhotoViewHeroAttributes(tag: args.images[index]),
              );
            },
            itemCount: args.images.length,
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(),
            ),
            onPageChanged: (value) => _currentIndex.value = value,
            backgroundDecoration: BoxDecoration(color: theme.backgroundColor),
          ),
        ),
      ),
    );
  }
}

class GalleryViewScreenArgs extends Equatable {
  final int currentIndex;
  final List<String> images;

  GalleryViewScreenArgs({this.currentIndex = 0, @required this.images});

  @override
  List<Object> get props => [currentIndex, images];
}

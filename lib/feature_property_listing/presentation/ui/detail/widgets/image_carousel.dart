import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';

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
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              log('Image tapped ${_currentIndex.value}');
            },
            child: CarouselSlider.builder(
              itemCount: widget.images.length,
              itemBuilder: (BuildContext context, int itemIndex) => CachedImage(
                widget.images[itemIndex] ?? '',
              ),
              options: CarouselOptions(
                pageViewKey: PageStorageKey('property-detail-carousel'),
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: false,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) => _currentIndex.value = index,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.map((url) {
                  int index = widget.images.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value == index
                          ? theme.primaryColor
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                })?.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

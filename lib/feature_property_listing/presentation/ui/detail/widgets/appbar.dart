import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget_2.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:scoped_model/scoped_model.dart';

class DetailSliverAppbar extends StatelessWidget {
  const DetailSliverAppbar({
    Key key,
    this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    final property = ScopedModel.of<PropertyDetailUIModel>(context);
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      title: isCollapsed
          ? SlideInUp(
              duration: const Duration(milliseconds: 200),
              child: Text(
                '${(property.entity.price.isPriceOnCall ?? true) ? 'Price on Call' : property.entity.price.formattedValue()}',
                style: theme.textTheme.subtitle1,
              ),
            )
          : null,
      leading: IconButton(
        icon: Icon(
          LineAwesomeIcons.angle_left,
          color: isCollapsed ? null : theme.backgroundColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            LineAwesomeIcons.heart_1,
            color: isCollapsed ? null : theme.backgroundColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            LineAwesomeIcons.share,
            color: isCollapsed ? null : theme.backgroundColor,
          ),
          onPressed: () {},
        ),
      ],
      expandedHeight: size.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: DetailAppbarCarousel(property: property),
      ),
    );
  }
}

class DetailAppbarCarousel extends StatefulWidget {
  const DetailAppbarCarousel({
    Key key,
    @required this.property,
  }) : super(key: key);

  final PropertyDetailUIModel property;

  @override
  _DetailAppbarCarouselState createState() => _DetailAppbarCarouselState();
}

class _DetailAppbarCarouselState extends State<DetailAppbarCarousel> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void dispose() {
    _currentIndex?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        CarouselSlider.builder(
          itemCount: widget.property.entity.media?.images?.length ?? 0,
          itemBuilder: (BuildContext context, int itemIndex) => CachedImage(
            widget.property.entity.media.images[itemIndex]?.fullPath ?? '',
          ),
          options: CarouselOptions(
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage:true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) => _currentIndex.value = index,
            scrollDirection: Axis.horizontal,
          ),
        ),
        // CachedImage(
        //   property.entity.media.images?.first?.fullPath ?? '',
        // ),
        Container(
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Colors.black45,
                Colors.black12,
                Colors.transparent,
                Colors.transparent
              ],
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
              children: widget.property.entity.media?.images?.map((url) {
                int index = widget.property.entity.media?.images?.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
    );
  }
}

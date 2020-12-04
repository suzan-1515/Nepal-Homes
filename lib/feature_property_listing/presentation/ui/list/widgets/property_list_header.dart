import 'package:flutter/material.dart';

class PropertyListHeader extends StatelessWidget {
  const PropertyListHeader();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Chip(
              label: Text('Apartment'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('Office'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('House'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('House'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('House'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('House'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(width: 8.0),
            Chip(
              label: Text('House'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
            ),
          ],
        ),
      ),
    );
  }
}

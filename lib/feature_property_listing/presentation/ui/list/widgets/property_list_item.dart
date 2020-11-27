import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';
import 'package:scoped_model/scoped_model.dart';

class PropertyListItem extends StatelessWidget {
  const PropertyListItem();
  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyUIModel>(context, rebuildOnChange: true);
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          width: 0.5,
          style: BorderStyle.solid,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1 / 1.1,
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Theme.of(context).dividerColor),
                    ),
                    child: CachedImage(
                      property.entity.media.images.first.fullPath,
                      tag: property.entity.id,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0),
                    Text(
                      property.entity.basic.title,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    IconText(
                        label: Text(
                          '${property.entity.address.area.name}, ${property.entity.address.city.name}',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        icon: Icon(
                          LineAwesomeIcons.search_location,
                          size: 16,
                        )),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

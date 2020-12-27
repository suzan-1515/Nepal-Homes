import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/filter_section_header.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/purpose_filter_item.dart';

class PropertyPurposeFilter extends StatelessWidget {
  final FilterUIModel filter;
  const PropertyPurposeFilter({
    Key key,
    @required this.filter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterSectionHeader(title: 'Looking For'),
        SizedBox(height: 8.0),
        PurposeFilterOptionsView(
          data: filter.entity.propertyMeta.propertyPurposes,
          selectedItem: filter.entity.propertyPurpose,
          onChanged: (value) => filter.entity = filter.entity.copyWith(
              propertyPurpose: Nullable<PropertyPurposeEntity>(value)),
        ),
      ],
    );
  }
}

class PurposeFilterOptionsView extends StatefulWidget {
  const PurposeFilterOptionsView({
    Key key,
    @required this.data,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  final List<PropertyPurposeEntity> data;
  final PropertyPurposeEntity selectedItem;
  final ValueChanged<PropertyPurposeEntity> onChanged;

  @override
  _PurposeFilterOptionsViewState createState() =>
      _PurposeFilterOptionsViewState();
}

class _PurposeFilterOptionsViewState extends State<PurposeFilterOptionsView> {
  PropertyPurposeEntity _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  void didUpdateWidget(covariant PurposeFilterOptionsView oldWidget) {
    this._selectedItem = widget.selectedItem;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    return GridView.count(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1.5,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      primary: false,
      shrinkWrap: true,
      children: widget.data
          .map(
            (e) => PurposeFilterItem(
              title: e.title,
              icon: CachedImage(
                e.media.fullPath,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
              selected: _selectedItem == e,
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? null : e;
                  widget.onChanged(_selectedItem);
                });
              },
            ),
          )
          .toList(),
    );
  }
}

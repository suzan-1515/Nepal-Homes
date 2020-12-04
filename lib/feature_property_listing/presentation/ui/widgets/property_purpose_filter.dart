import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_purpose_entity.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/filter_section_header.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/widgets/purpose_filter_item.dart';

class PropertyPurposeFilter extends StatelessWidget {
  final FilterUIModel filter;
  static final testData = [
    PropertyPurposeEntity(
        id: '1', media: null, description: null, title: 'Sale', order: 0),
    PropertyPurposeEntity(
        id: '2', media: null, description: null, title: 'Rent', order: 0),
  ];

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
          data: testData,
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
  }) : super(key: key);

  final List<PropertyPurposeEntity> data;
  final PropertyPurposeEntity selectedItem;

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
              icon: Icon(
                LineAwesomeIcons.home,
                size: 48,
              ),
              selected: _selectedItem == e,
              onTap: (value) {
                setState(() {
                  _selectedItem = value ? null : e;
                });
              },
            ),
          )
          .toList(),
    );
  }
}

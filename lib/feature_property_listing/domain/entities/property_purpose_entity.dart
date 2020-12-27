import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/image_entity.dart';

class PropertyPurposeEntity extends Equatable {
  PropertyPurposeEntity({
    @required this.id,
    @required this.media,
    @required this.description,
    @required this.title,
    @required this.order,
  });

  final String id;
  final ImageEntity media;
  final String description;
  final String title;
  final int order;

  PropertyPurposeEntity copyWith({
    String id,
    ImageEntity media,
    String description,
    String title,
    int order,
  }) =>
      PropertyPurposeEntity(
        id: id ?? this.id,
        media: media ?? this.media,
        description: description ?? this.description,
        title: title ?? this.title,
        order: order ?? this.order,
      );

  bool isRent() => title.contains('Rent');

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "media": media.toMap(),
        "description": description,
        "title": title,
        "order": order,
      };
  @override
  List<Object> get props => [id, media, description, title, order];

  @override
  bool get stringify => true;
}

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/image_caption_entity.dart';

class ImageCaptionModel extends ImageCaptionEntity {
  ImageCaptionModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory ImageCaptionModel.fromJson(String str) =>
      ImageCaptionModel.fromMap(json.decode(str));

  factory ImageCaptionModel.fromMap(Map<String, dynamic> json) =>
      ImageCaptionModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

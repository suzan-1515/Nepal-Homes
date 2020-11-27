import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/media_entity.dart';

class MediaModel extends MediaEntity {
  MediaModel({
    @required List<MediaImageModel> images,
  }) : super(images: images);

  factory MediaModel.fromJson(String str) =>
      MediaModel.fromMap(json.decode(str));

  factory MediaModel.fromMap(Map<String, dynamic> json) => MediaModel(
        images: json["images"] == null
            ? null
            : List<MediaImageModel>.from(
                json["images"].map((x) => MediaImageModel.fromMap(x['id']))),
      );
}

class MediaImageModel extends MediaImageEntity {
  MediaImageModel({
    @required String id,
    @required String filename,
    @required String path,
  }) : super(id: id, filename: filename, path: path);
  factory MediaImageModel.fromJson(String str) =>
      MediaImageModel.fromMap(json.decode(str));

  factory MediaImageModel.fromMap(Map<String, dynamic> json) => MediaImageModel(
        id: json["_id"],
        filename: json["filename"],
        path: json["path"],
      );
}

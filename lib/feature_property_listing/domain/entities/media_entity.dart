import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/core/constants/api_url_constants.dart';

class MediaEntity extends Equatable {
  MediaEntity({
    @required this.images,
  });

  final List<MediaImageEntity> images;

  MediaEntity copyWith({
    List<MediaImageEntity> images,
  }) =>
      MediaEntity(
        images: images ?? this.images,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "images": images == null
            ? null
            : List<dynamic>.from(
                images.map(
                  (x) => {'id': x.toMap()},
                ),
              ),
      };

  @override
  List<Object> get props => [images];
}

class MediaImageEntity extends Equatable {
  MediaImageEntity({
    @required this.id,
    @required this.filename,
    @required this.path,
  });

  final String id;
  final String filename;
  final String path;

  MediaImageEntity copyWith({
    String id,
    String filename,
    String path,
  }) =>
      MediaImageEntity(
        id: id ?? this.id,
        filename: filename ?? this.filename,
        path: path ?? this.path,
      );

  String get fullPath => '${APIUrlConstants.BASE_IMAGE_URL}$path';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "filename": filename,
        "path": path,
      };

  @override
  List<Object> get props => [id, filename, path];
}

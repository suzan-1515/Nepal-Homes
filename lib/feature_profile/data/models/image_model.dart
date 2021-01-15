import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_profile/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    @required String fieldName,
    @required String originalName,
    @required String encoding,
    @required String mimeType,
    @required String destination,
    @required String filename,
    @required String path,
    @required int size,
  }) : super(
            fieldName: fieldName,
            originalName: originalName,
            encoding: encoding,
            mimeType: mimeType,
            destination: destination,
            filename: filename,
            path: path,
            size: size);

  factory ImageModel.fromJson(String str) =>
      ImageModel.fromMap(json.decode(str));

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        fieldName: json["fieldname"],
        originalName: json["originalname"],
        encoding: json["encoding"],
        mimeType: json["mimetype"],
        destination: json["destination"],
        filename: json["filename"],
        path: json["path"],
        size: int.parse(json["size"]?.toString() ?? 0),
      );
}

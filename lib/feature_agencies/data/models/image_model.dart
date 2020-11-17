import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    @required String fieldname,
    @required String originalname,
    @required String encoding,
    @required String mimetype,
    @required String destination,
    @required String filename,
    @required String path,
    @required int size,
  }) : super(
            fieldname: fieldname,
            originalname: originalname,
            encoding: encoding,
            mimetype: mimetype,
            destination: destination,
            filename: filename,
            path: path,
            size: size);

  factory ImageModel.fromJson(String str) =>
      ImageModel.fromMap(json.decode(str));

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        fieldname: json["fieldname"],
        originalname: json["originalname"],
        encoding: json["encoding"],
        mimetype: json["mimetype"],
        destination: json["destination"],
        filename: json["filename"],
        path: json["path"],
        size: int.parse(json["size"]?.toString() ?? 0),
      );
}

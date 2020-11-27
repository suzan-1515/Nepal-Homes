import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';

class ImageEntity extends Equatable {
  ImageEntity({
    @required this.fieldname,
    @required this.originalname,
    @required this.encoding,
    @required this.mimetype,
    @required this.destination,
    @required this.filename,
    @required this.path,
    @required this.size,
  });

  final String fieldname;
  final String originalname;
  final String encoding;
  final String mimetype;
  final String destination;
  final String filename;
  final String path;
  final int size;

  ImageEntity copyWith({
    String fieldname,
    String originalname,
    String encoding,
    String mimetype,
    String destination,
    String filename,
    String path,
    int size,
  }) =>
      ImageEntity(
        fieldname: fieldname ?? this.fieldname,
        originalname: originalname ?? this.originalname,
        encoding: encoding ?? this.encoding,
        mimetype: mimetype ?? this.mimetype,
        destination: destination ?? this.destination,
        filename: filename ?? this.filename,
        path: path ?? this.path,
        size: size ?? this.size,
      );

  String get fullPath => '${APIUrlConstants.BASE_IMAGE_URL}$path';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "fieldname": fieldname,
        "originalname": originalname,
        "encoding": encoding,
        "mimetype": mimetype,
        "destination": destination,
        "filename": filename,
        "path": path,
        "size": size,
      };

  @override
  List<Object> get props => [
        fieldname,
        originalname,
        encoding,
        mimetype,
        destination,
        filename,
        path,
        size
      ];
}

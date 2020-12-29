import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';

class ImageEntity extends Equatable {
  ImageEntity({
    @required this.fieldName,
    @required this.originalName,
    @required this.encoding,
    @required this.mimeType,
    @required this.destination,
    @required this.filename,
    @required this.path,
    @required this.size,
  });

  final String fieldName;
  final String originalName;
  final String encoding;
  final String mimeType;
  final String destination;
  final String filename;
  final String path;
  final int size;

  ImageEntity copyWith({
    String fieldName,
    String originalName,
    String encoding,
    String mimeType,
    String destination,
    String filename,
    String path,
    int size,
  }) =>
      ImageEntity(
        fieldName: fieldName ?? this.fieldName,
        originalName: originalName ?? this.originalName,
        encoding: encoding ?? this.encoding,
        mimeType: mimeType ?? this.mimeType,
        destination: destination ?? this.destination,
        filename: filename ?? this.filename,
        path: path ?? this.path,
        size: size ?? this.size,
      );

  String get fullPath => '${APIUrlConstants.BASE_IMAGE_URL}$path';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "fieldname": fieldName,
        "originalname": originalName,
        "encoding": encoding,
        "mimetype": mimeType,
        "destination": destination,
        "filename": filename,
        "path": path,
        "size": size,
      };

  @override
  List<Object> get props => [
        fieldName,
        originalName,
        encoding,
        mimeType,
        destination,
        filename,
        path,
        size
      ];
}

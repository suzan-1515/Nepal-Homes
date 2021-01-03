import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/author_entity.dart';

import 'image_model.dart';

class AuthorModel extends AuthorEntity {
  AuthorModel({
    @required String id,
    @required String name,
    @required String bio,
    @required ImageModel image,
  }) : super(id: id, name: name, bio: bio, image: image);

  factory AuthorModel.fromJson(String str) =>
      AuthorModel.fromMap(json.decode(str));

  factory AuthorModel.fromMap(Map<String, dynamic> json) => AuthorModel(
        id: json["_id"],
        name: json["name"],
        bio: json["bio"],
        image: json["image"] == null ? null : ImageModel.fromMap(json["image"]),
      );
}

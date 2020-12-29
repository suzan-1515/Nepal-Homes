import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/author_entity.dart';

class AuthorModel extends AuthorEntity {
  AuthorModel({
    @required String id,
    @required String name,
  }) : super(id: id, name: name);

  factory AuthorModel.fromJson(String str) =>
      AuthorModel.fromMap(json.decode(str));

  factory AuthorModel.fromMap(Map<String, dynamic> json) => AuthorModel(
        id: json["_id"],
        name: json["name"],
      );
}

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/image_entity.dart';

class AuthorEntity extends Equatable {
  AuthorEntity({
    @required this.id,
    @required this.name,
    @required this.bio,
    @required this.image,
  });

  final String id;
  final String name;
  final String bio;
  final ImageEntity image;

  AuthorEntity copyWith({
    String id,
    String name,
    String bio,
    ImageEntity image,
  }) =>
      AuthorEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        bio: bio ?? this.bio,
        image: image ?? this.image,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "bio": bio,
        "image": image?.toMap(),
      };

  @override
  List<Object> get props => [id, name, bio, image];
}

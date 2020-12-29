import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class AuthorEntity extends Equatable{
  AuthorEntity({
    @required this.id,
    @required this.name,
  });

  final String id;
  final String name;

  AuthorEntity copyWith({
    String id,
    String name,
  }) =>
      AuthorEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );


  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
  };

  @override
  List<Object> get props => [id,name];
}

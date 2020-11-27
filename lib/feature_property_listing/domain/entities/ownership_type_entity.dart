import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class OwnershipTypeEntity extends Equatable {
  OwnershipTypeEntity({
    @required this.id,
    @required this.description,
    @required this.title,
    @required this.order,
  });

  final String id;
  final String description;
  final String title;
  final int order;

  OwnershipTypeEntity copyWith({
    String id,
    String description,
    String title,
    int order,
  }) =>
      OwnershipTypeEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        order: order ?? this.order,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "description": description,
        "title": title,
        "order": order,
      };

  @override
  List<Object> get props => [id, description, title, order];
}

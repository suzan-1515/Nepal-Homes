import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PriceLabelEntity extends Equatable {
  PriceLabelEntity({
    @required this.id,
    @required this.description,
    @required this.title,
    @required this.order,
  });

  final String id;
  final String description;
  final String title;
  final int order;

  PriceLabelEntity copyWith({
    String id,
    String description,
    String title,
    int order,
  }) {
    return PriceLabelEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      title: title ?? this.title,
      order: order ?? this.order,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'order': order,
    };
  }

  @override
  List<Object> get props => [id, description, title, order];

  @override
  bool get stringify => true;
}

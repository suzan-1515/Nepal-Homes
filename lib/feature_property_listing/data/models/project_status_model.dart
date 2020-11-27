import 'package:nepal_homes/feature_property_listing/domain/entities/project_status_entity.dart';

import 'package:meta/meta.dart';
import 'dart:convert';

class ProjectStatusModel extends ProjectStatusEntity {
  ProjectStatusModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory ProjectStatusModel.fromJson(String str) =>
      ProjectStatusModel.fromMap(json.decode(str));

  factory ProjectStatusModel.fromMap(Map<String, dynamic> json) =>
      ProjectStatusModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

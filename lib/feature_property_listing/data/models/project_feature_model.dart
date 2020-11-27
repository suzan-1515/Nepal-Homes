import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/project_feature_entity.dart';

class ProjectFeatureModel extends ProjectFeatureEntity {
  ProjectFeatureModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory ProjectFeatureModel.fromJson(String str) =>
      ProjectFeatureModel.fromMap(json.decode(str));

  factory ProjectFeatureModel.fromMap(Map<String, dynamic> json) =>
      ProjectFeatureModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

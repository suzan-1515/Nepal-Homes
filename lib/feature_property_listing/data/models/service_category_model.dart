import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/service_category_entity.dart';

class ServiceCategoryModel extends ServiceCategoryEntity {
  ServiceCategoryModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory ServiceCategoryModel.fromJson(String str) =>
      ServiceCategoryModel.fromMap(json.decode(str));

  factory ServiceCategoryModel.fromMap(Map<String, dynamic> json) =>
      ServiceCategoryModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

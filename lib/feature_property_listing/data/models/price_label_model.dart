import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/price_label_entity.dart';

class PriceLabelModel extends PriceLabelEntity {
  PriceLabelModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory PriceLabelModel.fromJson(String str) =>
      PriceLabelModel.fromMap(json.decode(str));

  factory PriceLabelModel.fromMap(Map<String, dynamic> json) => PriceLabelModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/currency_entity.dart';
import 'dart:convert';

class CurrencyModel extends CurrencyEntity {
  CurrencyModel({
    @required String id,
    @required String description,
    @required String title,
    @required int order,
  }) : super(id: id, description: description, title: title, order: order);

  factory CurrencyModel.fromJson(String str) =>
      CurrencyModel.fromMap(json.decode(str));

  factory CurrencyModel.fromMap(Map<String, dynamic> json) => CurrencyModel(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        order: json["order"],
      );
}

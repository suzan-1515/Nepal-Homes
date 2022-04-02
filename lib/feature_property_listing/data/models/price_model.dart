import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/data/models/price_label_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_entity.dart';

import 'currency_model.dart';

class PriceModel extends PriceEntity {
  PriceModel({
    @required bool isPriceOnCall,
    @required bool isStartingFrom,
    @required double value,
    @required CurrencyModel currency,
    @required PriceLabelModel label,
  }) : super(
            isPriceOnCall: isPriceOnCall,
            isStartingFrom: isStartingFrom,
            value: value,
            currency: currency,
            label: label);

  factory PriceModel.fromJson(String str) =>
      PriceModel.fromMap(json.decode(str));

  factory PriceModel.fromMap(Map<String, dynamic> json) => PriceModel(
        isPriceOnCall: json["is_price_on_call"] ?? true,
        isStartingFrom: json["is_starting_from"] ?? false,
        value: json["value"] == null
            ? 0.0
            : double.parse(json["value"].toString()),
        currency: json["currency"] == null
            ? null
            : CurrencyModel.fromMap(json["currency"]),
        label: json["label"] == null
            ? null
            : PriceLabelModel.fromMap(json["label"]),
      );
}

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/domain/entities/currency_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_label_entity.dart';

class PriceEntity extends Equatable {
  PriceEntity({
    @required this.isPriceOnCall,
    @required this.isStartingFrom,
    @required this.value,
    @required this.currency,
    @required this.label,
  });

  final bool isPriceOnCall;
  final bool isStartingFrom;
  final double value;
  final CurrencyEntity currency;
  final PriceLabelEntity label;

  PriceEntity copyWith({
    bool isPriceOnCall,
    bool isStartingFrom,
    double value,
    CurrencyEntity currency,
    PriceLabelEntity label,
  }) =>
      PriceEntity(
        isPriceOnCall: isPriceOnCall ?? this.isPriceOnCall,
        isStartingFrom: isStartingFrom ?? this.isStartingFrom,
        value: value ?? this.value,
        currency: currency ?? this.currency,
        label: label ?? this.label,
      );

  String formattedValue() =>
      NumberFormat.currency(locale: "en_US", symbol: "Rs. ", decimalDigits: 0)
          .format(value);

  String get resolvedPrice =>
      '${(isPriceOnCall ?? true) ? 'Price on Call' : formattedValue()}';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "is_price_on_call": isPriceOnCall,
        "is_starting_from": isStartingFrom,
        "value": value,
        "currency": currency?.toMap(),
        "label": label?.toMap(),
      };

  @override
  List<Object> get props =>
      [isPriceOnCall, isStartingFrom, value, label, currency];
}

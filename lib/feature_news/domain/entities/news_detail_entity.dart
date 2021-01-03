import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'news_entity.dart';

class NewsDetailEntity extends Equatable {
  NewsDetailEntity({
    @required this.success,
    @required this.data,
    @required this.msg,
  });

  final bool success;
  final NewsEntity data;
  final String msg;

  NewsDetailEntity copyWith({
    bool success,
    NewsEntity data,
    String msg,
  }) =>
      NewsDetailEntity(
        success: success ?? this.success,
        data: data ?? this.data,
        msg: msg ?? this.msg,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.toMap(),
        "msg": msg,
      };

  @override
  List<Object> get props => [
        success,
        data,
        msg,
      ];
}

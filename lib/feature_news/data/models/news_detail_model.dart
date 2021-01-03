import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';

import 'news_model.dart';

class NewsDetailModel extends NewsDetailEntity {
  NewsDetailModel({
    @required bool success,
    @required NewsModel data,
    @required String msg,
  }) : super(
          success: success,
          data: data,
          msg: msg,
        );

  factory NewsDetailModel.fromJson(String str) =>
      NewsDetailModel.fromMap(json.decode(str));

  factory NewsDetailModel.fromMap(Map<String, dynamic> json) => NewsDetailModel(
        success: json["success"],
        data: json["data"] == null ? null : NewsModel.fromMap(json["data"]),
        msg: json["msg"],
      );
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';

import 'news_model.dart';

class PaginatedNewsModel extends PaginatedNewsEntity {
  PaginatedNewsModel({
    @required bool success,
    @required List<NewsModel> data,
    @required String msg,
    @required int page,
    @required int size,
    @required int totalData,
  }) : super(
            success: success,
            data: data,
            msg: msg,
            page: page,
            size: size,
            totalData: totalData);

  factory PaginatedNewsModel.fromJson(String str) =>
      PaginatedNewsModel.fromMap(json.decode(str));

  factory PaginatedNewsModel.fromMap(Map<String, dynamic> json) =>
      PaginatedNewsModel(
        success: json["success"],
        data:
            json["data"]?.map<NewsModel>((x) => NewsModel.fromMap(x))?.toList(),
        msg: json["msg"],
        page: json["page"],
        size: json["size"],
        totalData: json["totaldata"],
      );
}

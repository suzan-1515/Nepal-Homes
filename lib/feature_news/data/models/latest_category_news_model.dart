import 'package:flutter/foundation.dart';

import 'news_model.dart';
import 'paginated_news_model.dart';

class LatestCategoryNewsModel extends PaginatedNewsModel {
  LatestCategoryNewsModel({
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

  factory LatestCategoryNewsModel.fromMap(Map<String, dynamic> json) =>
      LatestCategoryNewsModel(
        success: json["success"],
        data: json["data"]["blogs"]?.map<NewsModel>((x) {
          x['category'] = x['category']?.map((e) {
            if (json["data"]["category"] != null &&
                e['_id'] == json["data"]["category"]["_id"])
              return json["data"]["category"];
            return e;
          })?.toList();

          return NewsModel.fromMap(x);
        })?.toList(),
        msg: json["msg"],
        page: json["page"],
        size: json["size"],
        totalData: json["data"]["totaldata"],
      );
}

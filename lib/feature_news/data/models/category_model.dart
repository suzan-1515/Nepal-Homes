import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';

class CategoryWrapperModel extends CategoryWrapperEntity {
  CategoryWrapperModel({
    @required List<CategoryModel> data,
    @required bool success,
    @required String msg,
    @required int page,
    @required int size,
    @required int totalData,
  }) : super(
            data: data,
            success: success,
            msg: msg,
            page: page,
            size: size,
            totalData: totalData);

  factory CategoryWrapperModel.fromJson(String str) =>
      CategoryWrapperModel.fromMap(json.decode(str));

  factory CategoryWrapperModel.fromMap(Map<String, dynamic> json) =>
      CategoryWrapperModel(
        data: json["data"]
            ?.map<CategoryModel>((x) => CategoryModel.fromMap(x))
            ?.toList(),
        success: json["success"],
        msg: json["msg"],
        page: json["page"],
        size: json["size"],
        totalData: json["totaldata"],
      );
}

class CategoryModel extends CategoryEntity {
  CategoryModel({
    @required String id,
    @required bool isActive,
    @required bool isDeleted,
    @required String title,
    @required String description,
    @required String slugUrl,
    @required DateTime addedAt,
    @required DateTime updatedAt,
    @required String updatedBy,
  }) : super(
            id: id,
            isActive: isActive,
            isDeleted: isDeleted,
            title: title,
            description: description,
            slugUrl: slugUrl,
            addedAt: addedAt,
            updatedAt: updatedAt,
            updatedBy: updatedBy);

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        title: json["title"],
        description: json["description"],
        slugUrl: json["slug_url"],
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
      );
}

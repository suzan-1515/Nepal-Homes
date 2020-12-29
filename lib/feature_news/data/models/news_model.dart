import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';

import 'author_model.dart';
import 'category_model.dart';
import 'image_model.dart';

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

class NewsModel extends NewsEntity {
  NewsModel({
    @required List<String> metaTag,
    @required List<String> tags,
    @required List<AuthorModel> authors,
    @required List<String> keywords,
    @required List<CategoryModel> categories,
    @required bool isPublished,
    @required bool isHighlight,
    @required bool isShowcase,
    @required bool isActive,
    @required bool isDeleted,
    @required String id,
    @required String title,
    @required String slugUrl,
    @required String description,
    @required String summary,
    @required DateTime publishedOn,
    @required String shortDescription,
    @required String metaDescription,
    @required String addedBy,
    @required ImageModel image,
    @required DateTime deletedAt,
    @required DateTime addedAt,
    @required DateTime updatedAt,
  }) : super(
          metaTag: metaTag,
          tags: tags,
          authors: authors,
          keywords: keywords,
          categories: categories,
          isDeleted: isDeleted,
          isPublished: isPublished,
          isHighlight: isHighlight,
          isShowcase: isShowcase,
          isActive: isActive,
          id: id,
          title: title,
          slugUrl: slugUrl,
          description: description,
          summary: summary,
          publishedOn: publishedOn,
          shortDescription: shortDescription,
          metaDescription: metaDescription,
          addedBy: addedBy,
          addedAt: addedAt,
          image: image,
          deletedAt: deletedAt,
          updatedAt: updatedAt,
        );

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        metaTag: json["meta_tag"]?.map((x) => x)?.toList(),
        tags: json["tags"]?.map((x) => x)?.toList(),
        authors: json["author"]
            ?.map<AuthorModel>((x) => AuthorModel.fromMap(x))
            ?.toList(),
        keywords: json["keywords"]?.map((x) => x)?.toList(),
        categories: json["category"]
            ?.map<CategoryModel>((x) => CategoryModel.fromMap(x))
            ?.toList(),
        isPublished: json["is_published"],
        isHighlight: json["is_highlight"],
        isShowcase: json["is_showcase"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        id: json["_id"],
        title: json["title"],
        slugUrl: json["slug_url"],
        description: json["description"],
        summary: json["summary"],
        publishedOn: json["published_on"] == null
            ? null
            : DateTime.parse(json["published_on"]),
        shortDescription: json["short_description"],
        metaDescription: json["meta_description"],
        addedBy: json["added_by"],
        image: json["image"] == null ? null : ImageModel.fromMap(json["image"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

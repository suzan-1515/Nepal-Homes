import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/author_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/image_entity.dart';

class PaginatedNewsEntity extends Equatable {
  PaginatedNewsEntity({
    @required this.success,
    @required this.data,
    @required this.msg,
    @required this.page,
    @required this.size,
    @required this.totalData,
  });

  final bool success;
  final List<NewsEntity> data;
  final String msg;
  final int page;
  final int size;
  final int totalData;

  PaginatedNewsEntity copyWith({
    bool success,
    List<NewsEntity> data,
    String msg,
    int page,
    int size,
    int totalData,
  }) =>
      PaginatedNewsEntity(
        success: success ?? this.success,
        data: data ?? this.data,
        msg: msg ?? this.msg,
        page: page ?? this.page,
        size: size ?? this.size,
        totalData: totalData ?? this.totalData,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.map((x) => x.toMap())?.toList(),
        "msg": msg,
        "page": page,
        "size": size,
        "totaldata": totalData,
      };

  @override
  List<Object> get props => [success, data, msg, page, size, totalData];
}

class NewsEntity extends Equatable {
  NewsEntity({
    @required this.metaTag,
    @required this.tags,
    @required this.authors,
    @required this.keywords,
    @required this.categories,
    @required this.isPublished,
    @required this.isHighlight,
    @required this.isShowcase,
    @required this.isActive,
    @required this.isDeleted,
    @required this.id,
    @required this.title,
    @required this.slugUrl,
    @required this.description,
    @required this.summary,
    @required this.publishedOn,
    @required this.shortDescription,
    @required this.metaDescription,
    @required this.addedBy,
    @required this.image,
    @required this.deletedAt,
    @required this.addedAt,
    @required this.updatedAt,
  });

  final List<String> metaTag;
  final List<String> tags;
  final List<AuthorEntity> authors;
  final List<String> keywords;
  final List<CategoryEntity> categories;
  final bool isPublished;
  final bool isHighlight;
  final bool isShowcase;
  final bool isActive;
  final bool isDeleted;
  final String id;
  final String title;
  final String slugUrl;
  final String description;
  final String summary;
  final DateTime publishedOn;
  final String shortDescription;
  final String metaDescription;
  final String addedBy;
  final ImageEntity image;
  final DateTime deletedAt;
  final DateTime addedAt;
  final DateTime updatedAt;

  NewsEntity copyWith({
    List<String> metaTag,
    List<String> tags,
    List<AuthorEntity> author,
    List<String> keywords,
    List<CategoryEntity> category,
    bool isPublished,
    bool isHighlight,
    bool isShowcase,
    bool isActive,
    bool isDeleted,
    String id,
    String title,
    String slugUrl,
    String description,
    String summary,
    DateTime publishedOn,
    String shortDescription,
    String metaDescription,
    String addedBy,
    ImageEntity image,
    DateTime deletedAt,
    DateTime addedAt,
    DateTime updatedAt,
  }) =>
      NewsEntity(
        metaTag: metaTag ?? this.metaTag,
        tags: tags ?? this.tags,
        authors: author ?? this.authors,
        keywords: keywords ?? this.keywords,
        categories: category ?? this.categories,
        isPublished: isPublished ?? this.isPublished,
        isHighlight: isHighlight ?? this.isHighlight,
        isShowcase: isShowcase ?? this.isShowcase,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        id: id ?? this.id,
        title: title ?? this.title,
        slugUrl: slugUrl ?? this.slugUrl,
        description: description ?? this.description,
        summary: summary ?? this.summary,
        publishedOn: publishedOn ?? this.publishedOn,
        shortDescription: shortDescription ?? this.shortDescription,
        metaDescription: metaDescription ?? this.metaDescription,
        addedBy: addedBy ?? this.addedBy,
        image: image ?? this.image,
        deletedAt: deletedAt ?? this.deletedAt,
        addedAt: addedAt ?? this.addedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "meta_tag": metaTag?.map((x) => x)?.toList(),
        "tags": tags?.map((x) => x)?.toList(),
        "author": authors?.map((x) => x.toMap())?.toList(),
        "keywords": keywords?.map((x) => x)?.toList(),
        "category": categories.map((x) => x.toMap())?.toList(),
        "is_published": isPublished,
        "is_highlight": isHighlight,
        "is_showcase": isShowcase,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "_id": id,
        "title": title,
        "slug_url": slugUrl,
        "description": description,
        "summary": summary,
        "published_on": publishedOn?.toIso8601String(),
        "short_description": shortDescription,
        "meta_description": metaDescription,
        "added_by": addedBy,
        "image": image?.toMap(),
        "deleted_at": deletedAt?.toIso8601String(),
        "added_at": addedAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object> get props => [
        metaTag,
        tags,
        authors,
        keywords,
        categories,
        isPublished,
        isHighlight,
        isShowcase,
        isActive,
        isDeleted,
        id,
        title,
        slugUrl,
        description,
        summary,
        publishedOn,
        shortDescription,
        metaDescription,
        addedBy,
        image,
        deletedAt,
        addedAt,
        updatedAt,
      ];
}

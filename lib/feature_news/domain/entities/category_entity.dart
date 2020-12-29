import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CategoryWrapperEntity extends Equatable {
  CategoryWrapperEntity({
    @required this.data,
    @required this.success,
    @required this.msg,
    @required this.page,
    @required this.size,
    @required this.totalData,
  });

  final List<CategoryEntity> data;
  final bool success;
  final String msg;
  final int page;
  final int size;
  final int totalData;

  CategoryWrapperEntity copyWith({
    List<CategoryEntity> data,
    bool success,
    String msg,
    int page,
    int size,
    int totalData,
  }) =>
      CategoryWrapperEntity(
        data: data ?? this.data,
        success: success ?? this.success,
        msg: msg ?? this.msg,
        page: page ?? this.page,
        size: size ?? this.size,
        totalData: totalData ?? this.totalData,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "data": data?.map((x) => x.toMap())?.toList(),
        "success": success,
        "msg": msg,
        "page": page,
        "size": size,
        "totaldata": totalData,
      };

  @override
  List<Object> get props => [data, success, msg, page, size, totalData];
}

class CategoryEntity extends Equatable {
  CategoryEntity({
    @required this.id,
    @required this.isActive,
    @required this.isDeleted,
    @required this.title,
    @required this.description,
    @required this.slugUrl,
    @required this.addedAt,
    @required this.updatedAt,
    @required this.updatedBy,
  });

  final String id;
  final bool isActive;
  final bool isDeleted;
  final String title;
  final String description;
  final String slugUrl;
  final DateTime addedAt;
  final DateTime updatedAt;
  final String updatedBy;

  CategoryEntity copyWith({
    String id,
    bool isActive,
    bool isDeleted,
    String title,
    String description,
    String slugUrl,
    DateTime addedAt,
    DateTime updatedAt,
    String updatedBy,
  }) =>
      CategoryEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        title: title ?? this.title,
        description: description ?? this.description,
        slugUrl: slugUrl ?? this.slugUrl,
        addedAt: addedAt ?? this.addedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "title": title,
        "description": description,
        "slug_url": slugUrl,
        "added_at": addedAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
      };

  @override
  List<Object> get props => [
        id,
        isActive,
        isDeleted,
        title,
        description,
        slugUrl,
        addedAt,
        updatedAt,
        updatedBy
      ];
}

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_agencies/domain/entities/image_entity.dart';

class PaginatedAgencyEntity extends Equatable {
  PaginatedAgencyEntity({
    @required this.agencies,
    @required this.success,
    @required this.msg,
    @required this.page,
    @required this.size,
    @required this.totaldata,
  });

  final List<AgencyEntity> agencies;
  final bool success;
  final String msg;
  final int page;
  final int size;
  final int totaldata;

  PaginatedAgencyEntity copyWith({
    List<AgencyEntity> agencies,
    bool success,
    String msg,
    int page,
    int size,
    int totaldata,
  }) =>
      PaginatedAgencyEntity(
        agencies: agencies ?? this.agencies,
        success: success ?? this.success,
        msg: msg ?? this.msg,
        page: page ?? this.page,
        size: size ?? this.size,
        totaldata: totaldata ?? this.totaldata,
      );

  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(agencies.map((x) => x.toMap())),
        "success": success,
        "msg": msg,
        "page": page,
        "size": size,
        "totaldata": totaldata,
      };

  @override
  List<Object> get props => [agencies, success, msg, page, size, totaldata];
}

class AgencyEntity extends Equatable {
  AgencyEntity({
    @required this.id,
    @required this.isActive,
    @required this.isApproved,
    @required this.isDeleted,
    @required this.title,
    @required this.slugUrl,
    @required this.email,
    @required this.phone,
    @required this.address,
    @required this.mobile,
    @required this.description,
    @required this.website,
    @required this.addedBy,
    @required this.addedAt,
    @required this.logo,
    @required this.fbLink,
    @required this.agentsCount,
    @required this.productCount,
  });

  final String id;
  final bool isActive;
  final bool isApproved;
  final bool isDeleted;
  final String title;
  final String slugUrl;
  final String email;
  final String phone;
  final String address;
  final String mobile;
  final String description;
  final String website;
  final String addedBy;
  final DateTime addedAt;
  final ImageEntity logo;
  final String fbLink;
  final int agentsCount;
  final int productCount;

  AgencyEntity copyWith({
    String id,
    bool isActive,
    bool isApproved,
    bool isDeleted,
    String title,
    String slugUrl,
    String email,
    String phone,
    String address,
    String mobile,
    String description,
    String website,
    String addedBy,
    DateTime addedAt,
    ImageEntity logo,
    String fbLink,
    int agentsCount,
    int productCount,
  }) =>
      AgencyEntity(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isApproved: isApproved ?? this.isApproved,
        isDeleted: isDeleted ?? this.isDeleted,
        title: title ?? this.title,
        slugUrl: slugUrl ?? this.slugUrl,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        mobile: mobile ?? this.mobile,
        description: description ?? this.description,
        website: website ?? this.website,
        addedBy: addedBy ?? this.addedBy,
        addedAt: addedAt ?? this.addedAt,
        logo: logo ?? this.logo,
        fbLink: fbLink ?? this.fbLink,
        agentsCount: agentsCount ?? this.agentsCount,
        productCount: productCount ?? this.productCount,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "is_active": isActive,
        "is_approved": isApproved,
        "is_deleted": isDeleted,
        "title": title,
        "slug_url": slugUrl,
        "email": email,
        "phone": phone,
        "address": address,
        "mobile": mobile,
        "description": description,
        "website": website,
        "added_by": addedBy,
        "added_at": addedAt.toIso8601String(),
        "logo": logo.toMap(),
        "fb_link": fbLink,
        "agents_count": agentsCount,
        "product_count": productCount,
      };

  @override
  List<Object> get props => [
        id,
        isActive,
        isApproved,
        isDeleted,
        title,
        slugUrl,
        email,
        phone,
        address,
        mobile,
        description,
        website,
        addedBy,
        logo,
        fbLink,
        agentsCount,
        productCount
      ];
}

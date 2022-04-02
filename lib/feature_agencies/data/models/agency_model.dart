import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_agencies/data/models/image_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';

class PaginatedAgencyModel extends PaginatedAgencyEntity {
  PaginatedAgencyModel({
    @required List<AgencyEntity> agencies,
    @required bool success,
    @required String msg,
    @required int page,
    @required int size,
    @required int totaldata,
  }) : super(
            agencies: agencies,
            success: success,
            msg: msg,
            page: page,
            size: size,
            totaldata: totaldata);

  factory PaginatedAgencyModel.fromJson(String str) =>
      PaginatedAgencyModel.fromMap(json.decode(str));

  factory PaginatedAgencyModel.fromMap(Map<String, dynamic> json) =>
      PaginatedAgencyModel(
        agencies: List<AgencyModel>.from(
            json["data"].map((x) => AgencyModel.fromMap(x))),
        success: json["success"],
        msg: json["msg"],
        page: json["page"],
        size: json["size"],
        totaldata: json["totaldata"],
      );
}

class AgencyModel extends AgencyEntity {
  AgencyModel({
    @required String id,
    @required bool isActive,
    @required bool isApproved,
    @required bool isDeleted,
    @required String title,
    @required String slugUrl,
    @required String email,
    @required String phone,
    @required String address,
    @required String mobile,
    @required String description,
    @required String website,
    @required String addedBy,
    @required DateTime addedAt,
    @required ImageModel logo,
    @required String fbLink,
    @required int agentsCount,
    @required int productCount,
  }) : super(
            id: id,
            isActive: isActive,
            isApproved: isApproved,
            title: title,
            slugUrl: slugUrl,
            email: email,
            phone: phone,
            address: address,
            mobile: mobile,
            description: description,
            website: website,
            addedBy: addedBy,
            addedAt: addedAt,
            logo: logo,
            fbLink: fbLink,
            isDeleted: isDeleted,
            agentsCount: agentsCount,
            productCount: productCount);

  factory AgencyModel.fromJson(String str) =>
      AgencyModel.fromMap(json.decode(str));

  factory AgencyModel.fromMap(Map<String, dynamic> json) => AgencyModel(
        id: json["_id"],
        isActive: json["is_active"],
        isApproved: json["is_approved"],
        isDeleted: json["is_deleted"],
        title: json["title"],
        slugUrl: json["slug_url"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        mobile: json["mobile"],
        description: json["description"],
        website: json["website"],
        addedBy: json["added_by"],
        addedAt: (json["added_at"] == null)
            ? null
            : DateTime.parse(json["added_at"]),
        logo: (json["logo"] == null) ? null : ImageModel.fromMap(json["logo"]),
        fbLink: json['fb_link'],
        agentsCount: json["agents_count"],
        productCount: json["product_count"],
      );
}

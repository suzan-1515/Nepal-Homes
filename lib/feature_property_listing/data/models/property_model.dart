import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_model.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_property_listing/data/models/address_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/media_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/price_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/baisc_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/building_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';

import 'baisc_model.dart';
import 'building_model.dart';
import 'location_property_model.dart';

class PaginatedPropertyModel extends PaginatedPropertyEntity {
  PaginatedPropertyModel({
    @required List<PropertyModel> data,
    @required bool success,
    @required int page,
    @required int size,
    @required int totaldata,
  }) : super(
            data: data,
            success: success,
            page: page,
            size: size,
            totaldata: totaldata);

  factory PaginatedPropertyModel.fromJson(String str) =>
      PaginatedPropertyModel.fromMap(json.decode(str));

  factory PaginatedPropertyModel.fromMap(Map<String, dynamic> json) =>
      PaginatedPropertyModel(
        data: List<PropertyModel>.from(
            json["data"].map((x) => PropertyModel.fromMap(x))),
        success: json["success"],
        page: json["page"],
        size: json["size"],
        totaldata: json["totaldata"],
      );
}

class PropertyModel extends PropertyEntity {
  PropertyModel({
    @required String id,
    @required BasicEntity basic,
    @required BuildingEntity building,
    @required PriceEntity price,
    @required String prefix,
    @required bool isProject,
    @required bool isFeatured,
    @required bool isPremium,
    @required bool isNegotiable,
    @required String slugUrl,
    @required LocationPropertyModel locationProperty,
    @required MediaModel media,
    @required AgencyModel agency,
    @required String addedBy,
    @required DateTime addedAt,
    @required int propertyId,
    @required AddressEntity address,
  }) : super(
            id: id,
            basic: basic,
            building: building,
            price: price,
            prefix: prefix,
            isPremium: isPremium,
            isFeatured: isFeatured,
            isProject: isProject,
            isNegotiable: isNegotiable,
            slugUrl: slugUrl,
            locationProperty: locationProperty,
            media: media,
            agency: agency,
            addedBy: addedBy,
            addedAt: addedAt,
            propertyId: propertyId,
            address: address);

  factory PropertyModel.fromJson(String str) =>
      PropertyModel.fromMap(json.decode(str));

  factory PropertyModel.fromMap(Map<String, dynamic> json) => PropertyModel(
        id: json["_id"],
        basic: json["basic"] == null ? null : BasicModel.fromMap(json["basic"]),
        building: json["building"] == null
            ? null
            : BuildingModel.fromMap(json["building"]),
        price: json["price"] == null ? null : PriceModel.fromMap(json["price"]),
        prefix: json["prefix"],
        isProject: json["is_project"],
        isFeatured: json["is_featured"],
        isPremium: json["is_premium"],
        isNegotiable: json["is_negotiable"],
        slugUrl: json["slug_url"],
        locationProperty: json["location_property"] == null
            ? null
            : LocationPropertyModel.fromMap(json["location_property"]),
        media: json["media"] == null ? null : MediaModel.fromMap(json["media"]),
        addedBy: json["added_by"],
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        propertyId: json["property_id"],
        address: json["address"] == null
            ? null
            : AddressModel.fromMap(json["address"]),
        agency: json["agency_id"] == null
            ? null
            : AgencyModel.fromMap(json["agency_id"]),
      );
}

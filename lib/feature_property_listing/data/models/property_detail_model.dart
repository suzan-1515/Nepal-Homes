import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/data/models/agent_model.dart';

import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_property_listing/data/models/baisc_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/project_feature_model.dart';
import 'package:nepal_homes/feature_property_listing/data/models/property_type_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/baisc_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/building_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_property.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/media_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_feature_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';

import 'address_model.dart';
import 'building_model.dart';
import 'location_property_model.dart';
import 'media_model.dart';
import 'price_model.dart';

class PropertyDetailWrapperModel extends PropertyDetailWrapperEntity {
  PropertyDetailWrapperModel({
    @required bool success,
    @required PropertyDetailModel property,
    @required List<PropertyDetailModel> relatedProperties,
    @required String msg,
  }) : super(
            success: success,
            property: property,
            relatedProperties: relatedProperties,
            msg: msg);

  factory PropertyDetailWrapperModel.fromJson(String str) =>
      PropertyDetailWrapperModel.fromMap(json.decode(str));

  factory PropertyDetailWrapperModel.fromMap(Map<String, dynamic> json) {
    if (json == null || json['data'] == null) return null;
    return PropertyDetailWrapperModel(
      success: json["success"],
      property: json["data"]["properties"] == null
          ? null
          : PropertyDetailModel.fromMap(json["data"]["properties"]),
      relatedProperties: json["data"]["otherRelatedProperty"] == null
          ? null
          : json["data"]["otherRelatedProperty"]
              .map<PropertyDetailModel>((x) => PropertyDetailModel.fromMap(x))
              .toList(),
      msg: json["msg"],
    );
  }
}

class PropertyDetailModel extends PropertyDetailEntity {
  PropertyDetailModel({
    @required BasicEntity basic,
    @required AddressEntity address,
    @required LocationPropertyEntity locationProperty,
    @required BuildingEntity building,
    @required MediaEntity media,
    @required PriceEntity price,
    @required String prefix,
    @required bool isProject,
    @required bool postedByAdmin,
    @required bool isByAgency,
    @required bool isActive,
    @required bool isSave,
    @required bool isPending,
    @required bool isRejected,
    @required bool isFavourite,
    @required int favouriteCount,
    @required bool isAgree,
    @required bool isSoldOut,
    @required int soldOutPrice,
    @required bool isPublished,
    @required bool isFeatured,
    @required bool isVerified,
    @required bool isPremium,
    @required bool isExclusive,
    @required bool isNegotiable,
    @required bool isDeleted,
    @required List<String> tags,
    @required String id,
    @required String slugUrl,
    @required String mapSrc,
    @required List<ProjectFeatureEntity> projectFeatures,
    @required List<PropertyTypeEntity> projectPropertyType,
    @required String owenedBy,
    @required DateTime addedAt,
    @required int propertyId,
    @required AgencyEntity agency,
    @required AgentEntity agent,
    @required AgentEntity addedBy,
    @required DateTime verifiedAt,
    @required String verifiedBy,
  }) : super(
          basic: basic,
          address: address,
          locationProperty: locationProperty,
          building: building,
          media: media,
          price: price,
          prefix: prefix,
          isProject: isProject,
          postedByAdmin: postedByAdmin,
          isByAgency: isByAgency,
          isActive: isActive,
          isSave: isSave,
          isPending: isPending,
          isRejected: isRejected,
          isFavourite: isFavourite,
          favouriteCount: favouriteCount,
          isAgree: isAgree,
          isSoldOut: isSoldOut,
          soldOutPrice: soldOutPrice,
          isPremium: isPremium,
          isPublished: isPublished,
          isFeatured: isFeatured,
          isVerified: isVerified,
          isExclusive: isExclusive,
          isDeleted: isDeleted,
          isNegotiable: isNegotiable,
          tags: tags,
          slugUrl: slugUrl,
          mapSrc: mapSrc,
          projectFeatures: projectFeatures,
          projectPropertyType: projectPropertyType,
          addedAt: addedAt,
          owenedBy: owenedBy,
          propertyId: propertyId,
          agency: agency,
          agent: agent,
          addedBy: addedBy,
          verifiedAt: verifiedAt,
          verifiedBy: verifiedBy,
          id: id,
        );

  factory PropertyDetailModel.fromJson(String str) =>
      PropertyDetailModel.fromMap(json.decode(str));

  factory PropertyDetailModel.fromMap(Map<String, dynamic> json) =>
      PropertyDetailModel(
        basic: json["basic"] == null ? null : BasicModel.fromMap(json["basic"]),
        address: json["address"] == null
            ? null
            : AddressModel.fromMap(json["address"]),
        locationProperty: json["location_property"] == null
            ? null
            : LocationPropertyModel.fromMap(json["location_property"]),
        building: json["building"] == null
            ? null
            : BuildingModel.fromMap(json["building"]),
        media: json["media"] == null ? null : MediaModel.fromMap(json["media"]),
        price: json["price"] == null ? null : PriceModel.fromMap(json["price"]),
        prefix: json["prefix"],
        isProject: json["is_project"],
        postedByAdmin: json["posted_by_admin"],
        isByAgency: json["is_by_agency"],
        isActive: json["is_active"],
        isSave: json["is_save"],
        isPending: json["is_pending"],
        isRejected: json["is_rejected"],
        isFavourite: json["is_favourite"],
        favouriteCount: json["favourite_count"],
        isAgree: json["is_agree"],
        isSoldOut: json["is_sold_out"],
        soldOutPrice: json["sold_out_price"],
        isPublished: json["is_published"],
        isFeatured: json["is_featured"],
        isVerified: json["is_verified"],
        isPremium: json["is_premium"],
        isExclusive: json["is_exclusive"],
        isNegotiable: json["is_negotiable"],
        isDeleted: json["is_deleted"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"],
        slugUrl: json["slug_url"],
        mapSrc: json["map_src"],
        projectFeatures: json["project_features"] == null
            ? null
            : json["project_features"]
                .map<ProjectFeatureModel>((x) => ProjectFeatureModel.fromMap(x))
                .toList(),
        projectPropertyType: json["project_property_type"] == null
            ? null
            : json["project_property_type"]
                .map<PropertyTypeModel>((x) => PropertyTypeModel.fromMap(x))
                .toList(),
        owenedBy: json["owened_by"],
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        propertyId: json["property_id"],
        agency: json["agency_id"] == null
            ? null
            : AgencyModel.fromMap(json["agency_id"]),
        agent: json["agent_id"] == null
            ? null
            : AgentModel.fromMap(json["agent_id"]),
        addedBy: json["added_by"] == null
            ? null
            : AgentModel.fromMap(json["added_by"]),
        verifiedAt: json["verified_at"] == null
            ? null
            : DateTime.parse(json["verified_at"]),
        verifiedBy: json["verified_by"],
      );
}

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/baisc_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/building_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_property.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/media_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/project_feature_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_type_entity.dart';

class PropertyDetailWrapperEntity extends Equatable {
  PropertyDetailWrapperEntity({
    @required this.success,
    @required this.property,
    @required this.relatedProperties,
    @required this.msg,
  });

  final bool success;
  final PropertyDetailEntity property;
  final List<PropertyDetailEntity> relatedProperties;
  final String msg;

  PropertyDetailWrapperEntity copyWith({
    bool success,
    PropertyDetailEntity data,
    List<PropertyDetailEntity> relatedProperties,
    String msg,
  }) =>
      PropertyDetailWrapperEntity(
        success: success ?? this.success,
        property: data ?? this.property,
        relatedProperties: relatedProperties ?? this.relatedProperties,
        msg: msg ?? this.msg,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": {
          'properties': property?.toMap(),
          'otherRelatedProperty':
              relatedProperties?.map((e) => e.toMap())?.toList(),
        },
        "msg": msg,
      };

  @override
  List<Object> get props => [success, property, msg];
}

class PropertyDetailEntity extends Equatable {
  PropertyDetailEntity({
    @required this.basic,
    @required this.address,
    @required this.locationProperty,
    @required this.building,
    @required this.media,
    @required this.price,
    @required this.prefix,
    @required this.isProject,
    @required this.postedByAdmin,
    @required this.isByAgency,
    @required this.isActive,
    @required this.isSave,
    @required this.isPending,
    @required this.isRejected,
    @required this.isFavourite,
    @required this.favouriteCount,
    @required this.isAgree,
    @required this.isSoldOut,
    @required this.soldOutPrice,
    @required this.isPublished,
    @required this.isFeatured,
    @required this.isVerified,
    @required this.isPremium,
    @required this.isExclusive,
    @required this.isNegotiable,
    @required this.isDeleted,
    @required this.tags,
    @required this.id,
    @required this.slugUrl,
    @required this.mapSrc,
    @required this.projectFeatures,
    @required this.projectPropertyType,
    @required this.owenedBy,
    @required this.addedAt,
    @required this.propertyId,
    @required this.agency,
    @required this.agent,
    @required this.verifiedAt,
    @required this.verifiedBy,
  });

  final BasicEntity basic;
  final AddressEntity address;
  final LocationPropertyEntity locationProperty;
  final BuildingEntity building;
  final MediaEntity media;
  final PriceEntity price;
  final String prefix;
  final bool isProject;
  final bool postedByAdmin;
  final bool isByAgency;
  final bool isActive;
  final bool isSave;
  final bool isPending;
  final bool isRejected;
  final bool isFavourite;
  final int favouriteCount;
  final bool isAgree;
  final bool isSoldOut;
  final int soldOutPrice;
  final bool isPublished;
  final bool isFeatured;
  final bool isVerified;
  final bool isPremium;
  final bool isExclusive;
  final bool isNegotiable;
  final bool isDeleted;
  final List<String> tags;
  final String id;
  final String slugUrl;
  final String mapSrc;
  final List<ProjectFeatureEntity> projectFeatures;
  final List<PropertyTypeEntity> projectPropertyType;
  final String owenedBy;
  final DateTime addedAt;
  final int propertyId;
  final AgencyEntity agency;
  final AgentEntity agent;
  final DateTime verifiedAt;
  final String verifiedBy;

  PropertyDetailEntity copyWith({
    BasicEntity basic,
    AddressEntity address,
    LocationPropertyEntity locationProperty,
    BuildingEntity building,
    MediaEntity media,
    PriceEntity price,
    String prefix,
    bool isProject,
    bool postedByAdmin,
    bool isByAgency,
    bool isActive,
    bool isSave,
    bool isPending,
    bool isRejected,
    bool isFavourite,
    int favouriteCount,
    bool isAgree,
    bool isSoldOut,
    int soldOutPrice,
    bool isPublished,
    bool isFeatured,
    bool isVerified,
    bool isPremium,
    bool isExclusive,
    bool isNegotiable,
    bool isDeleted,
    List<String> tags,
    String id,
    String slugUrl,
    String mapSrc,
    List<ProjectFeatureEntity> projectFeatures,
    List<PropertyTypeEntity> projectPropertyType,
    String owenedBy,
    DateTime addedAt,
    int propertyId,
    AgencyEntity agency,
    AgentEntity agent,
    DateTime verifiedAt,
    String verifiedBy,
  }) {
    return PropertyDetailEntity(
      basic: basic ?? this.basic,
      address: address ?? this.address,
      locationProperty: locationProperty ?? this.locationProperty,
      building: building ?? this.building,
      media: media ?? this.media,
      price: price ?? this.price,
      prefix: prefix ?? this.prefix,
      isProject: isProject ?? this.isProject,
      postedByAdmin: postedByAdmin ?? this.postedByAdmin,
      isByAgency: isByAgency ?? this.isByAgency,
      isActive: isActive ?? this.isActive,
      isSave: isSave ?? this.isSave,
      isPending: isPending ?? this.isPending,
      isRejected: isRejected ?? this.isRejected,
      isFavourite: isFavourite ?? this.isFavourite,
      favouriteCount: favouriteCount ?? this.favouriteCount,
      isAgree: isAgree ?? this.isAgree,
      isSoldOut: isSoldOut ?? this.isSoldOut,
      soldOutPrice: soldOutPrice ?? this.soldOutPrice,
      isPublished: isPublished ?? this.isPublished,
      isFeatured: isFeatured ?? this.isFeatured,
      isVerified: isVerified ?? this.isVerified,
      isPremium: isPremium ?? this.isPremium,
      isExclusive: isExclusive ?? this.isExclusive,
      isNegotiable: isNegotiable ?? this.isNegotiable,
      isDeleted: isDeleted ?? this.isDeleted,
      tags: tags ?? this.tags,
      id: id ?? this.id,
      slugUrl: slugUrl ?? this.slugUrl,
      mapSrc: mapSrc ?? this.mapSrc,
      projectFeatures: projectFeatures ?? this.projectFeatures,
      projectPropertyType: projectPropertyType ?? this.projectPropertyType,
      owenedBy: owenedBy ?? this.owenedBy,
      addedAt: addedAt ?? this.addedAt,
      propertyId: propertyId ?? this.propertyId,
      agency: agency ?? this.agency,
      agent: agent ?? this.agent,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      verifiedBy: verifiedBy ?? this.verifiedBy,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'basic': basic?.toMap(),
      'address': address?.toMap(),
      'location_property': locationProperty?.toMap(),
      'building': building?.toMap(),
      'media': media?.toMap(),
      'price': price?.toMap(),
      'prefix': prefix,
      'is_project': isProject,
      'posted_by_admin': postedByAdmin,
      'is_by_agency': isByAgency,
      'is_active': isActive,
      'is_save': isSave,
      'is_pending': isPending,
      'is_rejected': isRejected,
      'is_favourite': isFavourite,
      'favourite_count': favouriteCount,
      'is_agree': isAgree,
      'is_sold_out': isSoldOut,
      'sold_out_price': soldOutPrice,
      'is_published': isPublished,
      'is_featured': isFeatured,
      'is_verified': isVerified,
      'is_premium': isPremium,
      'is_exclusive': isExclusive,
      'is_negotiable': isNegotiable,
      'is_deleted': isDeleted,
      'tags': tags,
      '_id': id,
      'slug_url': slugUrl,
      'map_src': mapSrc,
      'project_features': projectFeatures?.map((x) => x?.toMap())?.toList(),
      'project_property_type':
          projectPropertyType?.map((x) => x?.toMap())?.toList(),
      'owened_by': owenedBy,
      'added_at': addedAt?.millisecondsSinceEpoch,
      'property_id': propertyId,
      'agency_id': agency?.toMap(),
      'agent_id': agent?.toMap(),
      'verified_at': verifiedAt?.millisecondsSinceEpoch,
      'verified_by': verifiedBy,
    };
  }

  @override
  List<Object> get props {
    return [
      basic,
      address,
      locationProperty,
      building,
      media,
      price,
      prefix,
      isProject,
      postedByAdmin,
      isByAgency,
      isActive,
      isSave,
      isPending,
      isRejected,
      isFavourite,
      favouriteCount,
      isAgree,
      isSoldOut,
      soldOutPrice,
      isPublished,
      isFeatured,
      isVerified,
      isPremium,
      isExclusive,
      isNegotiable,
      isDeleted,
      tags,
      id,
      slugUrl,
      mapSrc,
      projectFeatures,
      projectPropertyType,
      owenedBy,
      addedAt,
      propertyId,
      agency,
      agent,
      verifiedAt,
      verifiedBy,
    ];
  }

  @override
  bool get stringify => true;
}

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/baisc_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/building_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/location_property.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/media_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/price_entity.dart';

class PaginatedPropertyEntity extends Equatable {
  PaginatedPropertyEntity({
    @required this.data,
    @required this.success,
    @required this.page,
    @required this.size,
    @required this.totaldata,
  });

  final List<PropertyEntity> data;
  final bool success;
  final int page;
  final int size;
  final int totaldata;

  PaginatedPropertyEntity copyWith({
    List<PropertyEntity> data,
    bool success,
    int page,
    int size,
    int totaldata,
  }) =>
      PaginatedPropertyEntity(
        data: data ?? this.data,
        success: success ?? this.success,
        page: page ?? this.page,
        size: size ?? this.size,
        totaldata: totaldata ?? this.totaldata,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "success": success,
        "page": page,
        "size": size,
        "totaldata": totaldata,
      };

  @override
  List<Object> get props => [data, success, page, size, totaldata];
}

class PropertyEntity extends Equatable {
  PropertyEntity({
    @required this.id,
    @required this.basic,
    @required this.building,
    @required this.price,
    @required this.prefix,
    @required this.isProject,
    @required this.isFeatured,
    @required this.isPremium,
    @required this.isNegotiable,
    @required this.slugUrl,
    @required this.locationProperty,
    @required this.media,
    @required this.agency,
    @required this.addedBy,
    @required this.addedAt,
    @required this.propertyId,
    @required this.address,
  });

  final String id;
  final BasicEntity basic;
  final BuildingEntity building;
  final PriceEntity price;
  final String prefix;
  final bool isProject;
  final bool isFeatured;
  final bool isPremium;
  final bool isNegotiable;
  final String slugUrl;
  final LocationPropertyEntity locationProperty;
  final MediaEntity media;
  final AgencyEntity agency;
  final String addedBy;
  final DateTime addedAt;
  final int propertyId;
  final AddressEntity address;

  PropertyEntity copyWith({
    String id,
    BasicEntity basic,
    BuildingEntity building,
    PriceEntity price,
    String prefix,
    bool isProject,
    bool isFeatured,
    bool isPremium,
    bool isNegotiable,
    String slugUrl,
    LocationPropertyEntity locationProperty,
    MediaEntity media,
    AgencyEntity agency,
    String addedBy,
    DateTime addedAt,
    int propertyId,
    AddressEntity address,
  }) =>
      PropertyEntity(
        id: id ?? this.id,
        basic: basic ?? this.basic,
        building: building ?? this.building,
        price: price ?? this.price,
        prefix: prefix ?? this.prefix,
        isProject: isProject ?? this.isProject,
        isFeatured: isFeatured ?? this.isFeatured,
        isPremium: isPremium ?? this.isPremium,
        isNegotiable: isNegotiable ?? this.isNegotiable,
        slugUrl: slugUrl ?? this.slugUrl,
        locationProperty: locationProperty ?? this.locationProperty,
        media: media ?? this.media,
        agency: agency ?? this.agency,
        addedBy: addedBy ?? this.addedBy,
        addedAt: addedAt ?? this.addedAt,
        propertyId: propertyId ?? this.propertyId,
        address: address ?? this.address,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "basic": basic?.toMap(),
        "building": building?.toMap(),
        "price": price?.toMap(),
        "prefix": prefix,
        "is_project": isProject,
        "is_featured": isFeatured,
        "is_premium": isPremium,
        "is_negotiable": isNegotiable,
        "slug_url": slugUrl,
        "location_property": locationProperty?.toMap(),
        "media": media?.toMap(),
        "agency_id": agency?.toMap(),
        "added_by": addedBy,
        "added_at": addedAt?.toIso8601String(),
        "property_id": propertyId,
        "address": address?.toMap(),
      };

  @override
  List<Object> get props => [
        id,
        basic,
        building,
        price,
        prefix,
        isProject,
        isPremium,
        isFeatured,
        isNegotiable,
        slugUrl,
        locationProperty,
        media,
        agency,
        addedBy,
        addedAt,
        propertyId,
        address
      ];
}

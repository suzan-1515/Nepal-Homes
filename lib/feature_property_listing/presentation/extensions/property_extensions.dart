import 'package:nepal_homes/core/models/nullable.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agent_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/address_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_filter_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_meta_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/filter_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_model.dart';

extension PropertyEntityX on PropertyEntity {
  PropertyUIModel get toUIModel => PropertyUIModel(this);
}

extension PropertyEntityListX on List<PropertyEntity> {
  List<PropertyUIModel> get toUIModel => this.map((e) => e.toUIModel).toList();
}

extension AgentEntityX on AgentEntity {
  AgentUIModel get toUIModel => AgentUIModel(this);
}

extension PropertyDetailEntityX on PropertyDetailEntity {
  PropertyDetailUIModel get toUIModel => PropertyDetailUIModel(this);
}

extension PropertyDetailEntityListX on List<PropertyDetailEntity> {
  List<PropertyDetailUIModel> get toUIModel =>
      this.map((e) => e.toUIModel).toList();
}

extension PropertyMetaEntityX on PropertyMetaEntity {
  PropertyFilterEntity get toFilter => PropertyFilterEntity(propertyMeta: this);
}

extension PropertyFilterEntityX on PropertyFilterEntity {
  FilterUIModel get toUIModel => FilterUIModel(this);

  PropertyQuery toQuery(PropertyQuery query) {
    return query.copyWith(
      areaId: (this.location is AreaEntity)
          ? Nullable<String>(this.location.id)
          : Nullable<String>(null),
      stateId: (this.location is StateEntity)
          ? Nullable<String>(this.location.id)
          : Nullable<String>(null),
      districtId: (this.location is DistrictEntity)
          ? Nullable<String>(this.location.id)
          : Nullable<String>(null),
      municipalityId: (this.location is MunicipalityEntity)
          ? Nullable<String>(this.location.id)
          : Nullable<String>(null),
      propertyPurposeId: Nullable<String>(this.propertyPurpose?.id),
      isPremium: Nullable<bool>(this.isPremium),
      isFeatured: Nullable<bool>(this.isFeatured),
      propertyCategoryId: Nullable<String>(this.propertyCategory?.id),
      propertyTypeId: Nullable<String>(this.propertyType?.id),
      priceRanceId: Nullable<int>(this.priceRange),
      roadType: Nullable<String>(this.roadType?.id),
      sort: Nullable<int>(this.sort),
    );
  }
}

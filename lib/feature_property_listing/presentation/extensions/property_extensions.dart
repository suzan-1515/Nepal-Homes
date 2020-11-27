import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agent_model.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_detail_entity.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_entity.dart';
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

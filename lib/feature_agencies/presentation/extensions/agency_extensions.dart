import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agent_model.dart';

extension AgencyEntityX on AgencyEntity {
  AgencyUIModel get toUIModel => AgencyUIModel(this);
}

extension AgencyEntityListX on List<AgencyEntity> {
  List<AgencyUIModel> get toUIModel => this.map((e) => e.toUIModel).toList();
}

extension AgentEntityX on AgentEntity {
  AgentUIModel get toUIModel => AgentUIModel(this);
}

extension AgencyDetailEntityX on AgencyDetailEntity {
  AgencyDetailUIModel get toUIModel => AgencyDetailUIModel(this);
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/data/models/agent_model.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';

class AgencyDetailWrapperModel extends AgencyDetailWrapperEntity {
  AgencyDetailWrapperModel({
    @required bool success,
    @required AgencyDetailModel data,
    @required String msg,
  }) : super(success: success, data: data, msg: msg);

  factory AgencyDetailWrapperModel.fromJson(String str) =>
      AgencyDetailWrapperModel.fromMap(json.decode(str));

  factory AgencyDetailWrapperModel.fromMap(Map<String, dynamic> json) =>
      AgencyDetailWrapperModel(
        success: json["success"],
        data: AgencyDetailModel.fromMap(json["data"]),
        msg: json["msg"],
      );
}

class AgencyDetailModel extends AgencyDetailEntity {
  AgencyDetailModel({
    @required AgencyEntity agency,
    @required List<AgentEntity> agents,
  }) : super(agency: agency, agents: agents);

  factory AgencyDetailModel.fromJson(String str) =>
      AgencyDetailModel.fromMap(json.decode(str));

  factory AgencyDetailModel.fromMap(Map<String, dynamic> json) =>
      AgencyDetailModel(
        agency: AgencyModel.fromMap(json["agencies"]),
        agents: List<AgentModel>.from(
            json["agents"].map((x) => AgentModel.fromMap(x))),
      );
}

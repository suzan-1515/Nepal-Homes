import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'dart:convert';

import 'package:nepal_homes/feature_agencies/domain/entities/agent_entity.dart';

class AgencyDetailWrapperEntity extends Equatable {
  AgencyDetailWrapperEntity({
    @required this.success,
    @required this.data,
    @required this.msg,
  });

  final bool success;
  final AgencyDetailEntity data;
  final String msg;

  AgencyDetailWrapperEntity copyWith({
    bool success,
    AgencyDetailEntity data,
    String msg,
  }) =>
      AgencyDetailWrapperEntity(
        success: success ?? this.success,
        data: data ?? this.data,
        msg: msg ?? this.msg,
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
        "msg": msg,
      };

  @override
  List<Object> get props => [success, data, msg];
}

class AgencyDetailEntity extends Equatable {
  AgencyDetailEntity({
    @required this.agency,
    @required this.agents,
  });

  final AgencyEntity agency;
  final List<AgentEntity> agents;

  AgencyDetailEntity copyWith({
    AgencyEntity agencies,
    List<AgentEntity> agents,
  }) =>
      AgencyDetailEntity(
        agency: agencies ?? this.agency,
        agents: agents ?? this.agents,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "agencies": agency.toMap(),
        "agents": List<AgentEntity>.from(agents.map((x) => x.toMap())),
      };

  @override
  List<Object> get props => [agency, agents];
}

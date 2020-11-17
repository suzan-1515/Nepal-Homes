import 'package:flutter/material.dart';
import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';

mixin Repository {
  Future<PaginatedAgencyEntity> getAgencies({@required PageConfig pageConfig});
  Future<AgencyDetailWrapperEntity> getAgencyDetail({@required String id});
}

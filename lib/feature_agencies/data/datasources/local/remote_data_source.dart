import 'package:meta/meta.dart';
import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_model.dart';

mixin RemoteDataSource {
  Future<PaginatedAgencyModel> fetchAgencies({@required PageConfig pageConfig});
  Future<AgencyDetailWrapperModel> fetchAgencyDetail({@required String id});
}

import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/feature_agencies/data/datasources/local/remote_data_source.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/data/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/data/services/remote_service.dart';

class AgencyRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  AgencyRemoteDataSource(this._remoteService);
  @override
  Future<PaginatedAgencyModel> fetchAgencies({PageConfig pageConfig}) async {
    var response = await _remoteService.fetchAgencies(pageConfig: pageConfig);
    return PaginatedAgencyModel.fromMap(response);
  }

  @override
  Future<AgencyDetailWrapperModel> fetchAgencyDetail({String id}) async {
    var response = await _remoteService.fetchAgencyDetail(id: id);
    return AgencyDetailWrapperModel.fromMap(response);
  }
}

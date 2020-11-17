import 'package:nepal_homes/core/exceptions/app_exceptions.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_agencies/data/datasources/local/remote_data_source.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_entity.dart';
import 'package:nepal_homes/feature_agencies/domain/entities/agency_detail_entity.dart';
import 'package:nepal_homes/core/models/page_config.dart';
import 'package:nepal_homes/feature_agencies/domain/repositories/repository.dart';

class AgencyRepository with Repository {
  final RemoteDataSource _remoteDataSource;
  final AnalyticsService _analyticsService;
  final NetworkInfo _networkInfo;

  AgencyRepository(
      this._remoteDataSource, this._analyticsService, this._networkInfo);
  @override
  Future<PaginatedAgencyEntity> getAgencies({PageConfig pageConfig}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchAgencies(pageConfig: pageConfig);
  }

  @override
  Future<AgencyDetailWrapperEntity> getAgencyDetail({String id}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchAgencyDetail(id: id);
  }
}

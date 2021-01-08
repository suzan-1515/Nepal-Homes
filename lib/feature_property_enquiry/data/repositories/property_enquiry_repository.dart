import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_property_enquiry/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/repositories/repository.dart';

class PropertyEnquiryRepository with Repository {
  final RemoteDataSource _authRemoteDataSource;
  final AnalyticsService _analyticsService;
  final NetworkInfo _networkInfo;

  PropertyEnquiryRepository(
      this._authRemoteDataSource, this._analyticsService, this._networkInfo);

  @override
  Future<void> postEnquiry({PropertyEnquiryRequestEntity request}) async {
    if (!await _networkInfo.isConnected) return;
    return _authRemoteDataSource.postEnquiry(enquiryRequest: request).then(
        (value) => _analyticsService.logPropertyEnquiryPosted(
            propertyId: request.propertyId));
  }
}

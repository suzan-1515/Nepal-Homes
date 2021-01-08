import 'package:nepal_homes/feature_property_enquiry/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_enquiry/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';

class PropertyEnquiryRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  PropertyEnquiryRemoteDataSource(this._remoteService);

  @override
  Future<void> postEnquiry({PropertyEnquiryRequestEntity enquiryRequest}) {
    return _remoteService.postEnquiry(enquiryRequest: enquiryRequest);
  }
}

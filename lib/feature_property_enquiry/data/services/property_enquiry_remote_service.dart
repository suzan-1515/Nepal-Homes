import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_auth/data/repositories/auth_repository.dart';
import 'package:nepal_homes/feature_property_enquiry/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';

class PropertyEnquiryRemoteService with RemoteService {
  static const String ENQUIRY_ENDPOINT = '/property/offer';

  final HttpManager httpManager;
  final AuthRepository authRepository;

  PropertyEnquiryRemoteService(this.httpManager, this.authRepository);

  @override
  Future postEnquiry({PropertyEnquiryRequestEntity enquiryRequest}) {
    // final Map<String, String> body = {
    //   'email': enquiryRequest.email,
    //   'name': enquiryRequest.name,
    //   'phone': enquiryRequest.phone,
    //   'message': enquiryRequest.message,
    // };
    // final Map<String, String> header = {
    //   "Authorization": userUIModel.entity?.token
    // };¬
    // final path = '$ENQUIRY_ENDPOINT/${enquiryRequest.propertyId}';
    // var call = httpManager.post(path: path, body: body, headers: header);
    //
    // return call;
    return Future.delayed(Duration(seconds: 2), () => true);
  }
}

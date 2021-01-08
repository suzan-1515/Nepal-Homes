import 'package:flutter/foundation.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';

mixin Repository {
  Future<void> postEnquiry({@required PropertyEnquiryRequestEntity request});
}

import 'package:meta/meta.dart';
import 'package:nepal_homes/core/models/page_config.dart';

mixin RemoteService {
  Future<dynamic> fetchAgencies({@required PageConfig pageConfig});
  Future<dynamic> fetchAgencyDetail({@required String id});
}

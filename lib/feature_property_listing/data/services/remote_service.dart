import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

mixin RemoteService {
  Future<dynamic> fetchProperties({@required PropertyQuery query});
  Future<dynamic> fetchPropertyDetail({@required String slug});
  Future<dynamic> fetchPropertiesByAgency({@required PropertyQuery query});
}

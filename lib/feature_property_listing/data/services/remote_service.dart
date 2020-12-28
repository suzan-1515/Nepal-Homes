import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';

mixin RemoteService {
  Future<dynamic> fetchProperties({@required PropertyQuery query});
  Future<dynamic> fetchHotProperties();
  Future<dynamic> fetchFeaturedProperties();
  Future<dynamic> fetchRecentProperties();
  Future<dynamic> fetchPremiumProperties();
  Future<dynamic> fetchPropertyDetail({@required String slug});
  Future<dynamic> fetchPropertiesByAgency({@required PropertyQuery query});
  Future<dynamic> fetchPropertyMetas();
  Future<dynamic> fetchPropertyCategories();
  Future<dynamic> fetchLocations();
}

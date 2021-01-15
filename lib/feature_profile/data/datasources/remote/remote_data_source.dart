import 'package:nepal_homes/feature_profile/data/models/user_profile_model.dart';

mixin RemoteDataSource {
  Future<UserProfileModel> fetchProfile();
}

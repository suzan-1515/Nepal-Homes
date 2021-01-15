import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';

mixin Repository {
  Future<UserProfileEntity> getUserProfile();
}

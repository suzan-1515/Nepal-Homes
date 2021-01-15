import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_profile/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/domain/repositories/repository.dart';

class UserProfileRepository with Repository {
  final RemoteDataSource _userProfileRemoteDataSource;
  final AnalyticsService _analyticsService;

  UserProfileRepository(
    this._userProfileRemoteDataSource,
    this._analyticsService,
  );

  @override
  Future<UserProfileEntity> getUserProfile() {
    return _userProfileRemoteDataSource.fetchProfile();
  }
}

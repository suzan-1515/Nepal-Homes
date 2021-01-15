import 'package:get_it/get_it.dart';
import 'package:nepal_homes/feature_auth/domain/entities/authenticated_user_entity.dart';
import 'package:nepal_homes/feature_profile/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_profile/data/models/user_profile_model.dart';
import 'package:nepal_homes/feature_profile/data/services/remote_service.dart';

class UserProfileRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  UserProfileRemoteDataSource(this._remoteService);

  @override
  Future<UserProfileModel> fetchProfile() async {
    final user = GetIt.I.get<AuthenticatedUserEntity>();
    var response = await _remoteService.fetchProfile(token: user.token);
    return UserProfileModel.fromMap(response);
  }
}

import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';
import 'package:nepal_homes/feature_profile/presentation/models/user_profile_model.dart';

extension UserProfileX on UserProfileEntity{
  UserProfileUIModel get toUIModel => UserProfileUIModel(this);
}
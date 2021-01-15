import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_social_link_entity.dart';

class UserSocialLinkModel extends UserSocialLinkEntity {
  UserSocialLinkModel({
    @required String fb,
    @required String twitter,
    @required String linkedIn,
  }) : super(fb: fb, twitter: twitter, linkedIn: linkedIn);

  factory UserSocialLinkModel.fromJson(String str) =>
      UserSocialLinkModel.fromMap(json.decode(str));

  factory UserSocialLinkModel.fromMap(Map<String, dynamic> json) =>
      UserSocialLinkModel(
        fb: json["fb"],
        twitter: json["twitter"],
        linkedIn: json["linkedIn"],
      );
}

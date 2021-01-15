import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_profile/data/models/user_role_model.dart';
import 'package:nepal_homes/feature_profile/domain/entities/user_profile_entity.dart';

import 'image_model.dart';
import 'user_social_link_model.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    @required UserSocialLinkModel socialLink,
    @required bool emailVerified,
    @required List<UserRoleModel> roles,
    @required String id,
    @required String name,
    @required String email,
    @required DateTime addedAt,
    @required DateTime dateOfBirth,
    @required String mobileNo,
    @required ImageModel image,
  }) : super(
          socialLink: socialLink,
          email: email,
          emailVerified: emailVerified,
          roles: roles,
          id: id,
          name: name,
          addedAt: addedAt,
          dateOfBirth: dateOfBirth,
          mobileNo: mobileNo,
          image: image,
        );

  factory UserProfileModel.fromJson(String str) =>
      UserProfileModel.fromMap(json.decode(str));

  factory UserProfileModel.fromMap(Map<String, dynamic> json) {
    if (json["data"] == null) return null;
    return UserProfileModel(
      socialLink: json["data"]["social_link"] == null
          ? null
          : UserSocialLinkModel.fromMap(json["data"]["social_link"]),
      emailVerified: json["data"]["email_verified"],
      roles: json["data"]["roles"] == null
          ? null
          : List<UserRoleModel>.from(
              json["data"]["roles"].map((x) => UserRoleModel.fromMap(x))),
      id: json["data"]["_id"],
      name: json["data"]["name"],
      email: json["data"]["email"],
      addedAt: json["data"]["added_at"] == null
          ? null
          : DateTime.parse(json["data"]["added_at"]),
      dateOfBirth: json["data"]["date_of_birth"] == null
          ? null
          : DateTime.parse(json["data"]["date_of_birth"]),
      mobileNo: json["data"]["mobile_no"],
      image: json["data"]["image"] == null
          ? null
          : ImageModel.fromMap(json["data"]["image"]),
    );
  }
}

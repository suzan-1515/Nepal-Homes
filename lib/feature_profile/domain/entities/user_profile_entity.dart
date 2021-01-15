import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'image_entity.dart';
import 'user_role_entity.dart';
import 'user_social_link_entity.dart';

class UserProfileEntity extends Equatable {
  UserProfileEntity({
    @required this.socialLink,
    @required this.emailVerified,
    @required this.roles,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.addedAt,
    @required this.dateOfBirth,
    @required this.mobileNo,
    @required this.image,
  });

  final UserSocialLinkEntity socialLink;
  final bool emailVerified;
  final List<UserRoleEntity> roles;
  final String id;
  final String name;
  final String email;
  final DateTime addedAt;
  final DateTime dateOfBirth;
  final String mobileNo;
  final ImageEntity image;

  UserProfileEntity copyWith({
    UserSocialLinkEntity socialLink,
    bool emailVerified,
    List<UserRoleEntity> roles,
    String id,
    String name,
    String email,
    DateTime addedAt,
    DateTime dateOfBirth,
    String mobileNo,
    ImageEntity image,
  }) =>
      UserProfileEntity(
        socialLink: socialLink ?? this.socialLink,
        emailVerified: emailVerified ?? this.emailVerified,
        roles: roles ?? this.roles,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        addedAt: addedAt ?? this.addedAt,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        mobileNo: mobileNo ?? this.mobileNo,
        image: image ?? this.image,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "social_link": socialLink?.toMap(),
        "email_verified": emailVerified,
        "roles": List<dynamic>.from(roles.map((x) => x?.toMap())),
        "_id": id,
        "name": name,
        "email": email,
        "added_at": addedAt?.toIso8601String(),
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "mobile_no": mobileNo,
        "image": image?.toMap(),
      };

  @override
  List<Object> get props => [
        socialLink,
        email,
        emailVerified,
        roles,
        id,
        name,
        addedAt,
        dateOfBirth,
        mobileNo,
        image,
      ];
}

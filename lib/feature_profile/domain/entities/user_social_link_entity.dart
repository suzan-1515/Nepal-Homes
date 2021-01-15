import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserSocialLinkEntity extends Equatable {
  UserSocialLinkEntity({
    @required this.fb,
    @required this.twitter,
    @required this.linkedIn,
  });

  final String fb;
  final String twitter;
  final String linkedIn;

  UserSocialLinkEntity copyWith({
    String fb,
    String twitter,
    String linkedIn,
  }) =>
      UserSocialLinkEntity(
        fb: fb ?? this.fb,
        twitter: twitter ?? this.twitter,
        linkedIn: linkedIn ?? this.linkedIn,
      );

  factory UserSocialLinkEntity.fromJson(String str) =>
      UserSocialLinkEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSocialLinkEntity.fromMap(Map<String, dynamic> json) =>
      UserSocialLinkEntity(
        fb: json["fb"],
        twitter: json["twitter"],
        linkedIn: json["linkedIn"],
      );

  Map<String, dynamic> toMap() => {
        "fb": fb,
        "twitter": twitter,
        "linkedIn": linkedIn,
      };

  @override
  List<Object> get props => [fb, twitter, linkedIn];
}

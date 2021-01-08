import 'dart:convert';

import 'package:equatable/equatable.dart';

class PropertyEnquiryRequestEntity extends Equatable {
  PropertyEnquiryRequestEntity({
    this.email,
    this.message,
    this.name,
    this.phone,
    this.propertyId,
  });

  final String email;
  final String message;
  final String name;
  final String phone;
  final String propertyId;

  PropertyEnquiryRequestEntity copyWith({
    String email,
    String message,
    String name,
    String phone,
    String propertyId,
  }) =>
      PropertyEnquiryRequestEntity(
        email: email ?? this.email,
        message: message ?? this.message,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        propertyId: propertyId ?? this.propertyId,
      );

  factory PropertyEnquiryRequestEntity.fromJson(String str) =>
      PropertyEnquiryRequestEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PropertyEnquiryRequestEntity.fromMap(Map<String, dynamic> json) =>
      PropertyEnquiryRequestEntity(
        email: json["email"],
        message: json["message"],
        name: json["name"],
        phone: json["phone"],
        propertyId: json["property_id"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "message": message,
        "name": name,
        "phone": phone,
        "property_id": propertyId,
      };

  @override
  List<Object> get props => [
        email,
        message,
        name,
        phone,
        propertyId,
      ];
}

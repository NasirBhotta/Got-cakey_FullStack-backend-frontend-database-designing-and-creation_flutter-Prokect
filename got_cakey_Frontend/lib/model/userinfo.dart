// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class UserInfo {
  final String verification_doc;
  final String issuing_state;
  final String buisness_name;
  final String registration_status;
  final String img;
  final String username;
  final String? bio;
  final String pickup_address;
  final String street_address;
  final String suburb;
  final String postcode;
  final String state;
  final List<String> baked_type;
  final String? suggestion;
  final String? contact_no;
  UserInfo({
    required this.contact_no,
    required this.verification_doc,
    required this.issuing_state,
    required this.buisness_name,
    required this.registration_status,
    required this.img,
    required this.username,
    this.bio,
    required this.pickup_address,
    required this.street_address,
    required this.suburb,
    required this.postcode,
    required this.state,
    required this.baked_type,
    this.suggestion,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'verification_doc': verification_doc,
      'issuing_state': issuing_state,
      'buisness_name': buisness_name,
      'registration_status': registration_status,
      'img': img,
      'username': username,
      'bio': bio,
      'pickup_address': pickup_address,
      'street_address': street_address,
      'suburb': suburb,
      'postcode': postcode,
      'state': state,
      'baked_type': baked_type,
      'suggestion': suggestion,
      'contact_no': contact_no
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
        verification_doc: map['food_license_img'] as String,
        issuing_state: map['issuing_state'] as String,
        buisness_name: map['company_name'] as String,
        registration_status: map['gst_registration_status'] as String,
        img: map['image_url'] as String,
        username: map['name'] as String,
        bio: map['short_bio'] != null ? map['short_bio'] as String : null,
        pickup_address: map['pickup_address'] as String,
        street_address: map['street_address'] as String,
        suburb: map['suburb'] as String,
        postcode: map['postcode'] as String,
        state: map['state'] as String,
        baked_type: [map['type']],
        suggestion:
            map['suggestion'] != null ? map['suggestion'] as String : null,
        contact_no:
            map['contact_no'] != null ? map['contact_no'] as String : null);
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(Map<String, dynamic> source) =>
      UserInfo.fromMap(source);

  @override
  String toString() {
    return 'UserInfo(verification_doc: $verification_doc, issuing_state: $issuing_state, buisness_name: $buisness_name, registration_status: $registration_status, img: $img, username: $username, bio: $bio, pickup_address: $pickup_address, street_address: $street_address, suburb: $suburb, postcode: $postcode, state: $state, baked_type: $baked_type, suggestion: $suggestion)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.verification_doc == verification_doc &&
        other.issuing_state == issuing_state &&
        other.buisness_name == buisness_name &&
        other.registration_status == registration_status &&
        other.img == img &&
        other.username == username &&
        other.bio == bio &&
        other.pickup_address == pickup_address &&
        other.street_address == street_address &&
        other.suburb == suburb &&
        other.postcode == postcode &&
        other.state == state &&
        listEquals(other.baked_type, baked_type) &&
        other.suggestion == suggestion;
  }

  @override
  int get hashCode {
    return verification_doc.hashCode ^
        issuing_state.hashCode ^
        buisness_name.hashCode ^
        registration_status.hashCode ^
        img.hashCode ^
        username.hashCode ^
        bio.hashCode ^
        pickup_address.hashCode ^
        street_address.hashCode ^
        suburb.hashCode ^
        postcode.hashCode ^
        state.hashCode ^
        baked_type.hashCode ^
        suggestion.hashCode;
  }
}

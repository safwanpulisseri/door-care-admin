// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/src/material/data_table.dart';

class FetchUserModel {
  String id;
  String name;
  String email;
  String mobile;
  String profileImg;
  bool isBlocked;

  FetchUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.profileImg,
    required this.isBlocked,
  });

  FetchUserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? profileImg,
    bool? isBlocked,
  }) {
    return FetchUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      profileImg: profileImg ?? this.profileImg,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'profile_img': profileImg,
      'isBlocked': isBlocked,
    };
  }

  factory FetchUserModel.fromMap(Map<String, dynamic> map) {
    log(map.length.toString());
    map.forEach(
      (key, value) {
        log("key -> $key value -> $value");
      },
    );
    return FetchUserModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      profileImg: map['profile_img'] as String,
      isBlocked: map['isBlocked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchUserModel.fromJson(String source) =>
      FetchUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchUserModel(id: $id, name: $name, email: $email, mobile: $mobile, profileImg: $profileImg, isBlocked: $isBlocked)';
  }

  @override
  bool operator ==(covariant FetchUserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.mobile == mobile &&
        other.profileImg == profileImg &&
        other.isBlocked == isBlocked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        profileImg.hashCode ^
        isBlocked.hashCode;
  }

  map(DataRow Function(dynamic user) param0) {}
}

import 'dart:convert';

class FetchUserModel {
  String id;
  String name;
  String email;
  String mobile;
  String profileImg;
  bool isBlocked;
  DateTime createdAt;

  FetchUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.profileImg,
    required this.isBlocked,
    required this.createdAt,
  });

  factory FetchUserModel.fromMap(Map<String, dynamic> map) {
    return FetchUserModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      profileImg: map['profile_img'] as String,
      isBlocked: map['isBlocked'] as bool,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'profile_img': profileImg,
      'isBlocked': isBlocked,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  factory FetchUserModel.fromJson(String source) =>
      FetchUserModel.fromMap(json.decode(source));
}

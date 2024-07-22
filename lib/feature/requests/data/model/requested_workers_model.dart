// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

class FetchWorkerModel {
  String id;
  String name;
  String email;
  String mobile;
  String district;
  String service;
  num experience;
  String profileImage;
  String idCardImage;
  bool isBlocked;
  DateTime createdAt;
  FetchWorkerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.district,
    required this.service,
    required this.experience,
    required this.profileImage,
    required this.idCardImage,
    required this.isBlocked,
    required this.createdAt,
  });

  FetchWorkerModel copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? district,
    String? service,
    num? experience,
    String? profileImage,
    String? idCardImage,
    bool? isBlocked,
    DateTime? createdAt,
  }) {
    return FetchWorkerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      district: district ?? this.district,
      service: service ?? this.service,
      experience: experience ?? this.experience,
      profileImage: profileImage ?? this.profileImage,
      idCardImage: idCardImage ?? this.idCardImage,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'district': district,
      'service': service,
      'experience': experience,
      'profile_img': profileImage,
      'idCard_img': idCardImage,
      'isBlocked': isBlocked,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FetchWorkerModel.fromMap(Map<String, dynamic> map) {
    log(map.length.toString());
    map.forEach(
      (key, value) {
        log("key -> $key value -> $value");
      },
    );
    return FetchWorkerModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      district: map['district'] as String,
      service: map['service'] as String,
      experience: map['experience'] as num,
      profileImage: map['profile_img'] as String,
      idCardImage: map['idCard_img'] as String,
      isBlocked: map['isBlocked'] as bool,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchWorkerModel.fromJson(String source) =>
      FetchWorkerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchWorkerModel(id: $id, name: $name, email: $email, mobile: $mobile, district: $district, service: $service, experience: $experience, profileImage: $profileImage, idCardImage: $idCardImage, isBlocked: $isBlocked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant FetchWorkerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.mobile == mobile &&
        other.district == district &&
        other.service == service &&
        other.experience == experience &&
        other.profileImage == profileImage &&
        other.idCardImage == idCardImage &&
        other.isBlocked == isBlocked &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        district.hashCode ^
        service.hashCode ^
        experience.hashCode ^
        profileImage.hashCode ^
        idCardImage.hashCode ^
        isBlocked.hashCode ^
        createdAt.hashCode;
  }
}

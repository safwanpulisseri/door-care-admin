// import 'dart:convert';
// import 'dart:developer';

// class UserModel {
//   String id;
//   String name;
//   String email;
//   String token; // Added token field

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.token, // Initialize token
//   });

//   UserModel copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? token, // Added token to copyWith
//   }) {
//     return UserModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       token: token ?? this.token, // Update token if provided
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       '_id': id,
//       'name': name,
//       'email': email,
//       'token': token, // Include token in map
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     log(map.length.toString());
//     map.forEach(
//       (key, value) {
//         log("key -> $key value -> $value");
//       },
//     );
//     return UserModel(
//       id: map['_id'] as String,
//       name: map['name'] as String,
//       email: map['email'] as String,
//       token: map['token'] as String, // Initialize token
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromJson(String source) =>
//       UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() =>
//       'UserModel(id: $id, name: $name, email: $email, token: $token)';

//   @override
//   bool operator ==(covariant UserModel other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.email == email &&
//         other.token == token;
//   }

//   @override
//   int get hashCode =>
//       id.hashCode ^ name.hashCode ^ email.hashCode ^ token.hashCode;
// }

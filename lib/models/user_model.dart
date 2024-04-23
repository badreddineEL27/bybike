import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String fcmToken;
  String location;
  String photoUrl;

  UserModel.empty({
    this.id = '',
    this.name = '',
    this.email = '',
    this.fcmToken = '',
    this.location = '',
    this.photoUrl = '',
  });
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.fcmToken,
    required this.location,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ??'',
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      fcmToken: json['fcmToken'] ?? "",
      location: json['location'] ?? "",
      photoUrl: json['photoUrl'] ?? "",
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final json = snapshot.data()??{};
     return UserModel(
      id: json['id'] ??'',
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      fcmToken: json['fcmToken'] ?? "",
      location: json['location'] ?? "",
      photoUrl: json['photoUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'fcmToken': fcmToken,
      'location': location,
      'photoUrl': photoUrl,
    };
  }
}

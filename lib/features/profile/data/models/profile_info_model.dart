import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';

class ProfileInfoModel extends ProfileInfoEntity {
  final String imageUrl;
  final String name;

  const ProfileInfoModel({required this.imageUrl, required this.name})
      : super(
          nameEntity: name,
          imageUrlEntity: imageUrl,
        );

  factory ProfileInfoModel.fromFirebaseUser(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      ProfileInfoModel(
        imageUrl: document.data()!['imageUrl'],
        name: document.data()!['name'],
      );
}

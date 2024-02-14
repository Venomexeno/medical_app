import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';

class RecentDoctorModel extends RecentDoctorEntity {
  final String uid;
  final String name;
  final String imageUrl;

  const RecentDoctorModel({
    required this.uid,
    required this.name,
    required this.imageUrl,
  }) : super(
          uidEntity: uid,
          imageUrlEntity: imageUrl,
          nameEntity: name,
        );

  factory RecentDoctorModel.fromFirebaseUser(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      RecentDoctorModel(
        uid: document.data()!['uid'],
        name: document.data()!['name'],
        imageUrl: document.data()!['imageUrl'],
      );
}

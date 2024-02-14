import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';

class RecommendedDoctorModel extends RecommendedDoctorEntity {
  final String imageUrl;
  final String uid;
  final String name;
  final String specialization;
  final num rating;

  const RecommendedDoctorModel({
    required this.imageUrl,
    required this.uid,
    required this.name,
    required this.specialization,
    required this.rating,
  }) : super(
          imageUrlEntity: imageUrl,
          uidEntity: uid,
          nameEntity: name,
          specializationEntity: specialization,
          ratingEntity: rating,
        );

  factory RecommendedDoctorModel.fromFirebaseDoctor(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      RecommendedDoctorModel(
        imageUrl: document.data()!['imageUrl'],
        uid: document.data()!['uid'],
        name: document.data()!['name'],
        specialization: document.data()!['specialization'],
        rating: document.data()!['rating'],
      );
}

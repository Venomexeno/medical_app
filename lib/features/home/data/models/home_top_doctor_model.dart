import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';

class HomeTopDoctorModel extends HomeTopDoctorEntity {
  final String name;
  final num rating;
  final String specialization;
  final String imageUrl;
  final String uid;

  const HomeTopDoctorModel(
      {required this.imageUrl,
      required this.name,
      required this.rating,
      required this.specialization,
      required this.uid})
      : super(
          nameEntity: name,
          ratingEntity: rating,
          specializationEntity: specialization,
          imageUrlEntity: imageUrl,
          uidEntity: uid,
        );

  factory HomeTopDoctorModel.fromFirebaseDoctor(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      HomeTopDoctorModel(
        imageUrl: document.data()!['imageUrl'],
        name: document.data()!['name'],
        rating: document.data()!['rating'],
        specialization: document.data()!['specialization'],
        uid: document.data()!['uid'],
      );
}

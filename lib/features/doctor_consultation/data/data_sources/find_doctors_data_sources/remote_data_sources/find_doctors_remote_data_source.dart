import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/doctor_consultation/data/models/find_doctors_models/recent_doctor_model.dart';
import 'package:medical_app/features/doctor_consultation/data/models/find_doctors_models/recommended_doctor_model.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recent_doctors_use_case.dart';

abstract class FindDoctorsRemoteDataSource {
  Future<RecommendedDoctorEntity> fetchRecommendedDoctor();

  Future<List<RecentDoctorEntity>> fetchRecentDoctors(
      FetchRecentDoctorsParameters parameters);
}

class FindDoctorsRemoteDataSourceImpl extends FindDoctorsRemoteDataSource {
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<RecommendedDoctorEntity> fetchRecommendedDoctor() async {
    final recommendedDoctor = await firebaseFireStore
        .collection('doctors')
        .orderBy('rating', descending: true)
        .limit(1)
        .get();

    return RecommendedDoctorModel.fromFirebaseDoctor(
        recommendedDoctor.docs.single);
  }

  @override
  Future<List<RecentDoctorEntity>> fetchRecentDoctors(
      FetchRecentDoctorsParameters parameters) async {
    final snapShot = await firebaseFireStore
        .collection('users')
        .doc(parameters.uid)
        .collection('userData')
        .doc('recentDoctors')
        .get();
    final List<String> doctorsUids = List<String>.from(snapShot.data()!['recentDoctorsUids']);
    final List<RecentDoctorEntity> doctorsData = [];
    for (var doctorUid in doctorsUids) {
      final doctorSnapshot = await FirebaseFirestore.instance
          .collection('doctors') // Replace with your collection name
          .doc(doctorUid)
          .get();
      doctorsData.add(RecentDoctorModel.fromFirebaseUser(doctorSnapshot));
    }
    return doctorsData;
  }
}

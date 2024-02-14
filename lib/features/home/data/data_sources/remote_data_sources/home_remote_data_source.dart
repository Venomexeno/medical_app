import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/features/home/data/models/home_top_doctor_model.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeTopDoctorEntity>> fetchHomeTopDoctors();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<List<HomeTopDoctorEntity>> fetchHomeTopDoctors() async {
    final doctorsData = await firebaseFireStore
        .collection('doctors')
        .orderBy('rating', descending: true)
        .limit(5)
        .get();
    return doctorsData.docs
        .map((e) => HomeTopDoctorModel.fromFirebaseDoctor(e))
        .toList();
  }
}

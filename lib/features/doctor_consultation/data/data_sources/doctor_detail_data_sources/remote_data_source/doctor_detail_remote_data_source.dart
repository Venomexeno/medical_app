import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/doctor_detail_use_cases/update_recent_doctors_use_case.dart';

abstract class DoctorDetailRemoteDataSource {
  Future<Unit> updateRecentDoctors(UpdateRecentDoctorsParameters parameters);
}

class DoctorDetailRemoteDataSourceImpl extends DoctorDetailRemoteDataSource {
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<Unit> updateRecentDoctors(
      UpdateRecentDoctorsParameters parameters) async {
    final userRef = firebaseFireStore
        .collection('users')
        .doc(parameters.userUid)
        .collection('userData')
        .doc('recentDoctors');

    final snapShot = await userRef.get();

    final List<String> doctorsUids;
    if (snapShot.exists) {
      doctorsUids = List<String>.from(snapShot.data()!['recentDoctorsUids']);
    } else {
      doctorsUids = [];
      await userRef.set({'recentDoctorsUids': doctorsUids});
    }

    await _addOrUpdateDoctorUid(
        doctorsUids: doctorsUids, parameters: parameters);

    return unit;
  }

  Future<void> _addOrUpdateDoctorUid({
    required UpdateRecentDoctorsParameters parameters,
    required List<String> doctorsUids,
  }) async {
    if (doctorsUids.contains(parameters.doctorUid)) {
      doctorsUids.remove(parameters.doctorUid);
    }

    doctorsUids.insert(0, parameters.doctorUid);

    await firebaseFireStore
        .collection('users')
        .doc(parameters.userUid)
        .collection('userData')
        .doc('recentDoctors')
        .update({
      'recentDoctorsUids': doctorsUids,
    });
  }
}

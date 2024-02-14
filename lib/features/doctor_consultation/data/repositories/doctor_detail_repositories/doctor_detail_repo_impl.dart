import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/doctor_consultation/data/data_sources/doctor_detail_data_sources/remote_data_source/doctor_detail_remote_data_source.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/doctor_detail_repo/doctor_details_repo.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/doctor_detail_use_cases/update_recent_doctors_use_case.dart';

class DoctorDetailRepoImpl extends DoctorDetailRepo {
  final DoctorDetailRemoteDataSource doctorDetailRemoteDataSource;

  DoctorDetailRepoImpl(this.doctorDetailRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> updateRecentDoctors(
      UpdateRecentDoctorsParameters parameters) async {
    await doctorDetailRemoteDataSource.updateRecentDoctors(parameters);
    try {
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }
}

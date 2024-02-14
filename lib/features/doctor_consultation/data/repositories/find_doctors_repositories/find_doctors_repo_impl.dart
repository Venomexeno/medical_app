import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/doctor_consultation/data/data_sources/find_doctors_data_sources/remote_data_sources/find_doctors_remote_data_source.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/find_doctors_repositories/find_doctors_repository.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recent_doctors_use_case.dart';

class FindDoctorsRepoImpl extends FindDoctorsRepo {
  final FindDoctorsRemoteDataSource findDoctorsRemoteDataSource;

  FindDoctorsRepoImpl(this.findDoctorsRemoteDataSource);

  @override
  Future<Either<Failure, RecommendedDoctorEntity>>
      fetchRecommendedDoctor() async {
    try {
      final recommendedDoctor =
          await findDoctorsRemoteDataSource.fetchRecommendedDoctor();
      return right(recommendedDoctor);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      } else {
        return left(Failure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<RecentDoctorEntity>>> fetchRecentDoctors(
      FetchRecentDoctorsParameters parameters) async {
    try {
      final recentDoctors =
          await findDoctorsRemoteDataSource.fetchRecentDoctors(parameters);
      return right(recentDoctors);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      } else {
        return left(Failure(e.toString()));
      }
    }
  }
}

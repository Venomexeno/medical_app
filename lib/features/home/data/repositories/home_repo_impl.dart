import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/home/data/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';
import 'package:medical_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<HomeTopDoctorEntity>>>
      fetchHomeTopDoctors() async {
    try {
      final doctorData = await homeRemoteDataSource.fetchHomeTopDoctors();
      return right(doctorData);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }
}

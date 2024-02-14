import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/profile/data/data_sources/remote_data_sources/profile_remote_data_source.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';
import 'package:medical_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:medical_app/features/profile/domain/use_cases/fetch_porfile_info_use_case.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileInfoEntity>> fetchProfileInfo(
      FetchProfileInfoParameters parameters) async {
    try {
      final profileData =
          await profileRemoteDataSource.fetchProfileInfo(parameters);
      return right(profileData);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }
}

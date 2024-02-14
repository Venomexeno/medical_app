import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';
import 'package:medical_app/features/profile/domain/use_cases/fetch_porfile_info_use_case.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileInfoEntity>> fetchProfileInfo(FetchProfileInfoParameters parameters);
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/use_case.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';
import 'package:medical_app/features/profile/domain/repositories/profile_repo.dart';

class FetchProfileInfoUseCase
    extends UseCase<ProfileInfoEntity, FetchProfileInfoParameters> {
  final ProfileRepo profileRepo;

  FetchProfileInfoUseCase(this.profileRepo);

  @override
  Future<Either<Failure, ProfileInfoEntity>> call(
      FetchProfileInfoParameters parameters) async {
    return await profileRepo.fetchProfileInfo(parameters);
  }
}

class FetchProfileInfoParameters extends Equatable {
  final String uid;

  const FetchProfileInfoParameters({
    required this.uid,
  });

  @override
  List<Object?> get props => [
        uid,
      ];
}

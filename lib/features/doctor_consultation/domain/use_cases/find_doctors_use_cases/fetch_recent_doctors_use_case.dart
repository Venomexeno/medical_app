import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/use_case.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/find_doctors_repositories/find_doctors_repository.dart';

class FetchRecentDoctorsUseCase
    extends UseCase<List<RecentDoctorEntity>, FetchRecentDoctorsParameters> {
  final FindDoctorsRepo findDoctorsRepo;

  FetchRecentDoctorsUseCase(this.findDoctorsRepo);

  @override
  Future<Either<Failure, List<RecentDoctorEntity>>> call(
      FetchRecentDoctorsParameters parameters) async {
    return await findDoctorsRepo.fetchRecentDoctors(parameters);
  }
}

class FetchRecentDoctorsParameters extends Equatable {
  final String uid;

  const FetchRecentDoctorsParameters(this.uid);

  @override
  List<Object?> get props => [
        uid,
      ];
}

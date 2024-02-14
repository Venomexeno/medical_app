import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/use_case.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/doctor_detail_repo/doctor_details_repo.dart';

class UpdateRecentDoctorsUseCase
    extends UseCase<Unit, UpdateRecentDoctorsParameters> {
  final DoctorDetailRepo doctorDetailRepo;

  UpdateRecentDoctorsUseCase(this.doctorDetailRepo);

  @override
  Future<Either<Failure, Unit>> call(
      UpdateRecentDoctorsParameters parameters) async {
    return await doctorDetailRepo.updateRecentDoctors(parameters);
  }
}

class UpdateRecentDoctorsParameters extends Equatable {
  final String doctorUid;
  final String userUid;

  const UpdateRecentDoctorsParameters({
    required this.doctorUid,
    required this.userUid,
  });

  @override
  List<Object?> get props => [
        doctorUid,
        userUid,
      ];
}

import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/no_param_use_case.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/find_doctors_repositories/find_doctors_repository.dart';

class FetchRecommendedDoctorUseCase extends UseCase<RecommendedDoctorEntity> {
  final FindDoctorsRepo findDoctorsRepo;

  FetchRecommendedDoctorUseCase(this.findDoctorsRepo);

  @override
  Future<Either<Failure, RecommendedDoctorEntity>> call() async {
    return await findDoctorsRepo.fetchRecommendedDoctor();
  }
}

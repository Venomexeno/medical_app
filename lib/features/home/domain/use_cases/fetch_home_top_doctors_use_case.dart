import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/no_param_use_case.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';
import 'package:medical_app/features/home/domain/repositories/home_repo.dart';

class FetchHomeTopDoctorsUseCase extends UseCase<List<HomeTopDoctorEntity>> {
  final HomeRepo homeRepo;

  FetchHomeTopDoctorsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<HomeTopDoctorEntity>>> call() async {
    return await homeRepo.fetchHomeTopDoctors();
  }
}

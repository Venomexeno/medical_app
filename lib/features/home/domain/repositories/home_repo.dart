import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeTopDoctorEntity>>> fetchHomeTopDoctors();
}

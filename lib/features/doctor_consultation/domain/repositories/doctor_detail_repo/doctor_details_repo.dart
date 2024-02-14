import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/doctor_detail_use_cases/update_recent_doctors_use_case.dart';

abstract class DoctorDetailRepo {
  Future<Either<Failure, Unit>> updateRecentDoctors(UpdateRecentDoctorsParameters parameters);
}

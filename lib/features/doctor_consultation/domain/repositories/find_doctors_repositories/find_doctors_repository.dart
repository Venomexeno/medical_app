import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recent_doctors_use_case.dart';

abstract class FindDoctorsRepo {
  Future<Either<Failure, RecommendedDoctorEntity>> fetchRecommendedDoctor();

  Future<Either<Failure, List<RecentDoctorEntity>>> fetchRecentDoctors(FetchRecentDoctorsParameters parameters);
}

import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignInEntity>> signInWithEmailAndPassword(
      SignInParameters parameters);

  Future<Either<Failure, SignUpEntity>> signUp(SignUpParameters parameters);
}

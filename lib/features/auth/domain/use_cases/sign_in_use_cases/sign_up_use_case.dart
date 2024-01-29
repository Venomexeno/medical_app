import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/use_case.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase extends UseCase<SignUpEntity, SignUpParameters> {
  final AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  @override
  Future<Either<Failure, SignUpEntity>> call(SignUpParameters parameters) async{
    return await authRepo.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;
  final String password;
  final String name;

  const SignUpParameters({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        name,
      ];
}

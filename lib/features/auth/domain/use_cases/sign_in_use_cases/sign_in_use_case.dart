import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/use_case.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';

class SignInUseCase extends UseCase<SignInEntity, SignInParameters> {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  @override
  Future<Either<Failure, SignInEntity>> call(
      SignInParameters parameters) async {
    return await authRepo.signInWithEmailAndPassword(parameters);
  }
}

class SignInParameters extends Equatable {
  final String email;
  final String password;

  const SignInParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

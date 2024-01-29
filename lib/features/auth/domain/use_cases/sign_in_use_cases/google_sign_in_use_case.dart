import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/no_param_use_case.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';

class GoogleSignInUseCase extends UseCase<SignInEntity> {
  final AuthRepo authRepo;

  GoogleSignInUseCase(this.authRepo);

  @override
  Future<Either<Failure, SignInEntity>> call() async {
    return await authRepo.googleSignIn();
  }
}

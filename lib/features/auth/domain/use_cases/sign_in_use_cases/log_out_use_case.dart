import 'package:dartz/dartz.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/core/use_cases/no_param_use_case.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';

class LogOutUseCase extends UseCase<Unit> {
  final AuthRepo authRepo;

  LogOutUseCase(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await authRepo.logOut();
  }
}

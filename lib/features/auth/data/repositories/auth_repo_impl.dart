import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/core/errors/failure.dart';
import 'package:medical_app/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, SignInEntity>> signInWithEmailAndPassword(
      SignInParameters parameters) async {
    try {
      final userCredential =
          await authRemoteDataSource.signInWithEmailAndPassword(parameters);
      return right(userCredential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignInEntity>> googleSignIn() async {
    try {
      final userCredential = await authRemoteDataSource.signInWithGoogle();
      return right(userCredential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignUpEntity>> signUp(
      SignUpParameters parameters) async {
    try {
      final userCredential = await authRemoteDataSource.signUp(parameters);
      return right(userCredential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    await authRemoteDataSource.logOut();
    try {
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromAuth(e));
      }
      return left(Failure(e.toString()));
    }
  }
}

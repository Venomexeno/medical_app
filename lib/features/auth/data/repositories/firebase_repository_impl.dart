import 'package:medical_app/features/auth/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<void> forgotPassword(String email) async {
    await remoteDataSource.forgotPassword(email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    await remoteDataSource.getCreateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUserId() async =>
      await remoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    await remoteDataSource.getUpdateUser(user);
  }

  @override
  Future<void> googleAuth() async {
    await remoteDataSource.googleAuth();
  }

  @override
  Future<bool> isSignIn() async => await remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async {
    await remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await remoteDataSource.signUp(user);
  }
}

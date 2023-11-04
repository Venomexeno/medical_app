import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({
    required this.repository,
  });

  Future<void> signIn(UserEntity user)
  {
    return repository.signIn(user);
  }
}

import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;

  IsSignInUseCase({
    required this.repository,
  });

  Future<bool> call()
  {
    return repository.isSignIn();
  }
}
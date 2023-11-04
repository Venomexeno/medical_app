import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class GoogleAuthUseCase {
  final FirebaseRepository repository;

  GoogleAuthUseCase({
    required this.repository,
  });

  Future<void> googleAuth()
  {
    return repository.googleAuth();
  }
}

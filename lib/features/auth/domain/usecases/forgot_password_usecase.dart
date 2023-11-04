import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository repository;

  ForgotPasswordUseCase({
    required this.repository,
  });

  Future<void> forgotPassword(String email) {
    return repository.forgotPassword(email);
  }
}

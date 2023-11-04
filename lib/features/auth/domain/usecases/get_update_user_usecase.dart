import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class GetUpdateUserUseCase {
  final FirebaseRepository repository;

  GetUpdateUserUseCase({
    required this.repository,
  });

  Future<void> getUpdateUserUseCase(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}

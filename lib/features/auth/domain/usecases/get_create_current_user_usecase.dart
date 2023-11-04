import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({
    required this.repository,
  });

  Future<void> getCreateCurrentUser(UserEntity user) {
    return repository.getCreateCurrentUser(user);
  }
}

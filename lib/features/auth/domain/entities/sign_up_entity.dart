import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String uidEntity;
  final String emailEntity;
  final String? nameEntity;

  const SignUpEntity({
    required this.uidEntity,
    required this.emailEntity,
    this.nameEntity,
  });

  @override
  List<Object?> get props => [
        uidEntity,
        emailEntity,
        nameEntity,
      ];
}

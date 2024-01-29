class SignUpEntity {
  final String uidEntity;
  final String emailEntity;
  final String? nameEntity;

  SignUpEntity({
    required this.uidEntity,
    required this.emailEntity,
    this.nameEntity,
  });
}
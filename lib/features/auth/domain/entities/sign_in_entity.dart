import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String uidEntity;

  const SignInEntity({
    required this.uidEntity,
  });

  @override
  List<Object?> get props => [
        uidEntity,
      ];
}

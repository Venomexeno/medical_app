import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? uid;

  const UserEntity({
    this.name,
    this.email,
    this.password,
    this.uid,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        password,
        uid,
      ];
}

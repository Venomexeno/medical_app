import 'package:equatable/equatable.dart';

class ProfileInfoEntity extends Equatable {
  final String nameEntity;
  final String imageUrlEntity;

  const ProfileInfoEntity(
      {required this.nameEntity, required this.imageUrlEntity});

  @override
  List<Object?> get props => [
        nameEntity,
        imageUrlEntity,
      ];
}

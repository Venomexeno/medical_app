import 'package:equatable/equatable.dart';

class RecentDoctorEntity extends Equatable {
  final String uidEntity;
  final String imageUrlEntity;
  final String nameEntity;

  const RecentDoctorEntity({
    required this.uidEntity,
    required this.imageUrlEntity,
    required this.nameEntity,
  });

  @override
  List<Object?> get props => [
        uidEntity,
        imageUrlEntity,
        nameEntity,
      ];
}

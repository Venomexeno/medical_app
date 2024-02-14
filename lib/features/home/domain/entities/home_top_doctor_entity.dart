import 'package:equatable/equatable.dart';

class HomeTopDoctorEntity extends Equatable {
  final String nameEntity;
  final num ratingEntity;
  final String specializationEntity;
  final String imageUrlEntity;
  final String uidEntity;

  const HomeTopDoctorEntity({
    required this.nameEntity,
    required this.ratingEntity,
    required this.specializationEntity,
    required this.imageUrlEntity,
    required this.uidEntity,
  });

  @override
  List<Object?> get props => [
        nameEntity,
        ratingEntity,
        specializationEntity,
        imageUrlEntity,
        uidEntity,
      ];
}

import 'package:equatable/equatable.dart';

class RecommendedDoctorEntity extends Equatable {
  final String imageUrlEntity;
  final String uidEntity;
  final String nameEntity;
  final String specializationEntity;
  final num ratingEntity;

  const RecommendedDoctorEntity({
    required this.imageUrlEntity,
    required this.uidEntity,
    required this.nameEntity,
    required this.specializationEntity,
    required this.ratingEntity,
  });

  @override
  List<Object?> get props => [
        uidEntity,
        imageUrlEntity,
        nameEntity,
        specializationEntity,
        ratingEntity,
      ];
}

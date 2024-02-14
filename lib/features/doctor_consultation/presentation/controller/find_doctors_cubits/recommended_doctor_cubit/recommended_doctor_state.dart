part of 'recommended_doctor_cubit.dart';

abstract class RecommendedDoctorState extends Equatable {
  const RecommendedDoctorState();

  @override
  List<Object> get props => [];
}

class RecommendedDoctorInitial extends RecommendedDoctorState {}

class RecommendedDoctorLoading extends RecommendedDoctorState {}

class RecommendedDoctorSuccess extends RecommendedDoctorState {
  final RecommendedDoctorEntity recommendedDoctorEntity;

  const RecommendedDoctorSuccess(this.recommendedDoctorEntity);
}

class RecommendedDoctorFailure extends RecommendedDoctorState {
  final String errMessage;

  const RecommendedDoctorFailure(this.errMessage);
}

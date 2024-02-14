part of 'update_recent_doctor_cubit.dart';

abstract class UpdateRecentDoctorState extends Equatable {
  const UpdateRecentDoctorState();

  @override
  List<Object> get props => [];
}

class UpdateRecentDoctorInitial extends UpdateRecentDoctorState {}

class UpdateRecentDoctorLoading extends UpdateRecentDoctorState {}

class UpdateRecentDoctorFailure extends UpdateRecentDoctorState {
  final String errMessage;

  const UpdateRecentDoctorFailure(this.errMessage);
}

class UpdateRecentDoctorSuccess extends UpdateRecentDoctorState {}

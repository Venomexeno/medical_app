part of 'recent_doctors_cubit.dart';

abstract class RecentDoctorsState extends Equatable {
  const RecentDoctorsState();

  @override
  List<Object> get props => [];
}

class RecentDoctorsInitial extends RecentDoctorsState {}

class RecentDoctorsLoading extends RecentDoctorsState {}

class RecentDoctorsSuccess extends RecentDoctorsState {
  final List<RecentDoctorEntity> recentDoctors;

  const RecentDoctorsSuccess(this.recentDoctors);
}

class RecentDoctorsFailure extends RecentDoctorsState {
  final String errMessage;

  const RecentDoctorsFailure(this.errMessage);
}

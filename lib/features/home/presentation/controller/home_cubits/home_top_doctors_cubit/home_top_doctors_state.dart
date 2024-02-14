part of 'home_top_doctors_cubit.dart';

abstract class HomeTopDoctorsState extends Equatable {
  const HomeTopDoctorsState();

  @override
  List<Object> get props => [];
}

class HomeTopDoctorsInitial extends HomeTopDoctorsState {}

class HomeTopDoctorsLoading extends HomeTopDoctorsState {}

class HomeTopDoctorsSuccess extends HomeTopDoctorsState {
  final List<HomeTopDoctorEntity> homeTopDoctor;

  const HomeTopDoctorsSuccess(this.homeTopDoctor);
}

class HomeTopDoctorsFailure extends HomeTopDoctorsState {
  final String errMessage;

  const HomeTopDoctorsFailure(this.errMessage);
}

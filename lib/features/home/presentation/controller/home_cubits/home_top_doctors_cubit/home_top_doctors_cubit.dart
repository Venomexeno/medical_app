import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/home/domain/entities/home_top_doctor_entity.dart';
import 'package:medical_app/features/home/domain/use_cases/fetch_home_top_doctors_use_case.dart';

part 'home_top_doctors_state.dart';

class HomeTopDoctorsCubit extends Cubit<HomeTopDoctorsState> {
  HomeTopDoctorsCubit(this._fetchHomeTopDoctorsUseCase)
      : super(HomeTopDoctorsInitial());

  final FetchHomeTopDoctorsUseCase _fetchHomeTopDoctorsUseCase;

  Future<void> fetchTopDoctors() async {
    emit(HomeTopDoctorsLoading());
    final result = await _fetchHomeTopDoctorsUseCase();
    result.fold(
      (failure) => emit(HomeTopDoctorsFailure(failure.message)),
      (homeTopDoctors) => emit(HomeTopDoctorsSuccess(homeTopDoctors)),
    );
  }
}

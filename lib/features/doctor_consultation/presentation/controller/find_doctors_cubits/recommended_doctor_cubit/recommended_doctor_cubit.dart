import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recommended_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recommended_doctor_use_case.dart';

part 'recommended_doctor_state.dart';

class RecommendedDoctorCubit extends Cubit<RecommendedDoctorState> {
  RecommendedDoctorCubit(this._fetchRecommendedDoctorUseCase)
      : super(RecommendedDoctorInitial());

  final FetchRecommendedDoctorUseCase _fetchRecommendedDoctorUseCase;

  Future<void> fetchRecommendedDoctor() async {
    emit(RecommendedDoctorLoading());
    final result = await _fetchRecommendedDoctorUseCase();

    result.fold(
      (failure) => emit(RecommendedDoctorFailure(failure.message)),
      (recommendedDoctor) => emit(RecommendedDoctorSuccess(recommendedDoctor)),
    );
  }
}

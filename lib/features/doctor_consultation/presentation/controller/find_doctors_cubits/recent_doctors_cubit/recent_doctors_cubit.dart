import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/doctor_consultation/domain/entities/find_doctors_entites/recent_doctor_entity.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recent_doctors_use_case.dart';

part 'recent_doctors_state.dart';

class RecentDoctorsCubit extends Cubit<RecentDoctorsState> {
  RecentDoctorsCubit(this._fetchRecentDoctorsUseCase)
      : super(RecentDoctorsInitial());

  final FetchRecentDoctorsUseCase _fetchRecentDoctorsUseCase;

  Future<void> fetchRecentDoctors({required String uid}) async {
    emit(RecentDoctorsLoading());
    final result =
        await _fetchRecentDoctorsUseCase(FetchRecentDoctorsParameters(uid));

    result.fold(
      (failure) => emit(RecentDoctorsFailure(failure.message)),
      (recentDoctors) => emit(RecentDoctorsSuccess(recentDoctors)),
    );
  }
}

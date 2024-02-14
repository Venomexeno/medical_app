import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/doctor_detail_use_cases/update_recent_doctors_use_case.dart';

part 'update_recent_doctor_state.dart';

class UpdateRecentDoctorCubit extends Cubit<UpdateRecentDoctorState> {
  UpdateRecentDoctorCubit(this._updateRecentDoctorsUseCase)
      : super(UpdateRecentDoctorInitial());

  final UpdateRecentDoctorsUseCase _updateRecentDoctorsUseCase;

  Future<void> updateRecentDoctors(
      {required String userUid, required String doctorUid}) async {
    emit(UpdateRecentDoctorLoading());
    final result = await _updateRecentDoctorsUseCase(
        UpdateRecentDoctorsParameters(doctorUid: doctorUid, userUid: userUid));
    result.fold(
      (failure) => emit(UpdateRecentDoctorFailure(failure.message)),
      (doctorsUids) => emit(UpdateRecentDoctorSuccess()),
    );
  }
}

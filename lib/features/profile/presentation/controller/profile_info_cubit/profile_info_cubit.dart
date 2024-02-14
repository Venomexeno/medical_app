import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/profile/domain/entities/profle_info_entity.dart';
import 'package:medical_app/features/profile/domain/use_cases/fetch_porfile_info_use_case.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit(this._fetchProfileInfoUseCase) : super(ProfileInfoInitial());

  final FetchProfileInfoUseCase _fetchProfileInfoUseCase;

  Future<void> fetchProfileInfo({required String uid}) async {
    emit(ProfileInfoLoading());
    final result = await _fetchProfileInfoUseCase(
      FetchProfileInfoParameters(
        uid: uid,
      ),
    );
    result.fold(
      (failure) => emit(ProfileInfoFailure(failure.message)),
      (profileInfo) => emit(ProfileInfoSuccess(profileInfo)),
    );
  }
}

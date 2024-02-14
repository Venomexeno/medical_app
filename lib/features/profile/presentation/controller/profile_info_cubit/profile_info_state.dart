part of 'profile_info_cubit.dart';

abstract class ProfileInfoState extends Equatable {
  const ProfileInfoState();

  @override
  List<Object> get props => [];
}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoSuccess extends ProfileInfoState {
  final ProfileInfoEntity profileInfoEntity;

  const ProfileInfoSuccess(this.profileInfoEntity);
}

class ProfileInfoFailure extends ProfileInfoState {
  final String errMessage;

  const ProfileInfoFailure(this.errMessage);
}

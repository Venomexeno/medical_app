part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpEntity signUpEntity;

  const SignUpSuccess(this.signUpEntity);
}

class SignUpFailure extends SignUpState {
  final String errMessage;

  const SignUpFailure(this.errMessage);
}

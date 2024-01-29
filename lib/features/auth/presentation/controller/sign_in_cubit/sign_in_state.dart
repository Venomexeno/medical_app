part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SignInEntity signInEntity;

  const SignInSuccess(this.signInEntity);

}

class SignInFailure extends SignInState {
  final String errMessage;

  const SignInFailure(this.errMessage);

}

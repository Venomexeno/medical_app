part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticating extends AuthState {
  final LoadingMethod loadingMethod;

  const Authenticating(this.loadingMethod);
}

class Authenticated extends AuthState {
  final SignInEntity signInEntity;

  const Authenticated(this.signInEntity);
}

class AuthenticationFailure extends AuthState {
  final String errMessage;

  const AuthenticationFailure(this.errMessage);
}

class UnAuthenticated extends AuthState {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/google_sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/log_out_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase _signInUseCase;

  final LogOutUseCase _logOutUseCase;

  final GoogleSignInUseCase _googleSignInUseCase;

  AuthCubit(this._signInUseCase, this._logOutUseCase, this._googleSignInUseCase)
      : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(EmailAndPasswordAuthenticating());
    final result = await _signInUseCase(
      SignInParameters(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (failure) => emit(AuthenticationFailure(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> googleSignIn() async {
    emit(GoogleAuthenticating());
    final result = await _googleSignInUseCase();
    result.fold(
      (failure) => emit(AuthenticationFailure(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> logOut() async {
    emit(EmailAndPasswordAuthenticating());
    final result = await _logOutUseCase();
    result.fold(
      (failure) => emit(AuthenticationFailure(failure.message)),
      (r) => emit(UnAuthenticated()),
    );
  }
}

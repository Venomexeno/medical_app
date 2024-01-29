import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInCubit(this._signInUseCase) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    final result = await _signInUseCase(
      SignInParameters(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}

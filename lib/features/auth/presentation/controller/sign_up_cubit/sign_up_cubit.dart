import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase _signUpUseCase;

  Future<void> signUp(String name, String password, String email) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(SignUpParameters(
      email: email,
      password: password,
      name: name,
    ));
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
}

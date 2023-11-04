import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/google_auth_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitial());

  Future<void> submitSignIn({required UserEntity userEntity}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.signIn(userEntity);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity userEntity}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.signUp(userEntity);
      await getCreateCurrentUserUseCase.getCreateCurrentUser(userEntity);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleAuth({required UserEntity userEntity}) async {
    try {
      googleAuthUseCase.googleAuth();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({required UserEntity userEntity}) async {
    try {
      forgotPasswordUseCase.forgotPassword(userEntity.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}

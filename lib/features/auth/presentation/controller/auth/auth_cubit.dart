import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_app/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/get_current_user_id_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    required this.getCurrentUserIdUseCase,
    required this.signOutUseCase,
    required this.isSignInUseCase,
  }) : super(AuthInitial());

  Future<void> appStared() async {
    try {
      final isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUserIdUseCase.call();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUserIdUseCase.call();
      emit(AuthenticatedState(uid: uid));

    } catch(_)
    {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedOut() async {
    try {
      signOutUseCase.signOut();
      emit(UnAuthenticatedState());

    } catch(_)
    {
      emit(UnAuthenticatedState());
    }
  }
}

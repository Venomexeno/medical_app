import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app/features/auth/data/remote_data_source/firebase_remote_data_source.dart';
import 'package:medical_app/features/auth/data/remote_data_source/firebase_remote_data_source_impl.dart';
import 'package:medical_app/features/auth/data/repositories/firebase_repository_impl.dart';
import 'package:medical_app/features/auth/domain/repositories/firebase_repository.dart';
import 'package:medical_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/get_current_user_id_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/google_auth_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:medical_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:medical_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/credential/credential_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory<AuthCubit>(
      () => AuthCubit(
        getCurrentUserIdUseCase: sl.call(),
        signOutUseCase: sl.call(),
        isSignInUseCase: sl.call(),
      ),
    );

    sl.registerFactory<CredentialCubit>(
      () => CredentialCubit(
        signInUseCase: sl.call(),
        signUpUseCase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        googleAuthUseCase: sl.call(),
      ),
    );

    ///UseCase
    //AuthCubit UseCases
    sl.registerLazySingleton<GetCurrentUserIdUseCase>(
        () => GetCurrentUserIdUseCase(repository: sl.call()));

    sl.registerLazySingleton<SignOutUseCase>(
        () => SignOutUseCase(repository: sl.call()));

    sl.registerLazySingleton<IsSignInUseCase>(
        () => IsSignInUseCase(repository: sl.call()));

    //Credential UseCases
    sl.registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(repository: sl.call()));

    sl.registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(repository: sl.call()));

    sl.registerLazySingleton<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(repository: sl.call()));

    sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
        () => GetCreateCurrentUserUseCase(repository: sl.call()));

    sl.registerLazySingleton<GoogleAuthUseCase>(
        () => GoogleAuthUseCase(repository: sl.call()));

    ///Repository
    sl.registerLazySingleton<FirebaseRepository>(
        () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

    ///Remote DataSource
    sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
        fireStore: sl.call(),
        auth: sl.call(),
        googleSignIn: sl.call(),
      ),
    );

    ///Local DataSource

    ///External
    final auth = FirebaseAuth.instance;
    final fireStore = FirebaseFirestore.instance;
    final googleSignIn = GoogleSignIn();

    sl.registerLazySingleton(() => auth);
    sl.registerLazySingleton(() => fireStore);
    sl.registerLazySingleton(() => googleSignIn);
  }
}

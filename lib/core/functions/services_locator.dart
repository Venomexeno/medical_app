import 'package:get_it/get_it.dart';
import 'package:medical_app/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:medical_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/sign_in_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Cubit
    // Auth Cubits
    sl.registerFactory<SignInCubit>(() => SignInCubit(sl.call()));
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl.call()));

    // Doctor Detail cubits
    sl.registerFactory<DateSelectorCubit>(() => DateSelectorCubit());
    sl.registerFactory<TimeSelectorCubit>(() => TimeSelectorCubit());

    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //Auth Use Cases
    sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl.call()));
    sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //Auth Repository
    sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///DataSource
    //Auth DataSource
    sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
  }
}

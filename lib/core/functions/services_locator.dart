import 'package:get_it/get_it.dart';
import 'package:medical_app/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:medical_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:medical_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/google_sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/log_out_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_in_use_case.dart';
import 'package:medical_app/features/auth/domain/use_cases/sign_in_use_cases/sign_up_use_case.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:medical_app/features/doctor_consultation/data/data_sources/doctor_detail_data_sources/remote_data_source/doctor_detail_remote_data_source.dart';
import 'package:medical_app/features/doctor_consultation/data/data_sources/find_doctors_data_sources/remote_data_sources/find_doctors_remote_data_source.dart';
import 'package:medical_app/features/doctor_consultation/data/repositories/doctor_detail_repositories/doctor_detail_repo_impl.dart';
import 'package:medical_app/features/doctor_consultation/data/repositories/find_doctors_repositories/find_doctors_repo_impl.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/doctor_detail_repo/doctor_details_repo.dart';
import 'package:medical_app/features/doctor_consultation/domain/repositories/find_doctors_repositories/find_doctors_repository.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/doctor_detail_use_cases/update_recent_doctors_use_case.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recent_doctors_use_case.dart';
import 'package:medical_app/features/doctor_consultation/domain/use_cases/find_doctors_use_cases/fetch_recommended_doctor_use_case.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/doctor_detail_cubit/update_recent_doctor_cubit/update_recent_doctor_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/find_doctors_cubits/recent_doctors_cubit/recent_doctors_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/controller/find_doctors_cubits/recommended_doctor_cubit/recommended_doctor_cubit.dart';
import 'package:medical_app/features/home/data/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:medical_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:medical_app/features/home/domain/repositories/home_repo.dart';
import 'package:medical_app/features/home/domain/use_cases/fetch_home_top_doctors_use_case.dart';
import 'package:medical_app/features/home/presentation/controller/home_cubits/home_top_doctors_cubit/home_top_doctors_cubit.dart';
import 'package:medical_app/features/profile/data/data_sources/remote_data_sources/profile_remote_data_source.dart';
import 'package:medical_app/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:medical_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:medical_app/features/profile/domain/use_cases/fetch_porfile_info_use_case.dart';
import 'package:medical_app/features/profile/presentation/controller/profile_info_cubit/profile_info_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Cubit
    //Auth Cubits
    sl.registerFactory<AuthCubit>(
        () => AuthCubit(sl.call(), sl.call(), sl.call()));
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl.call()));

    //Home Cubits
    sl.registerFactory<HomeTopDoctorsCubit>(
        () => HomeTopDoctorsCubit(sl.call()));

    //Profile Cubits
    sl.registerFactory<ProfileInfoCubit>(() => ProfileInfoCubit(sl.call()));

    //Find Doctors Cubits
    sl.registerFactory<RecommendedDoctorCubit>(
        () => RecommendedDoctorCubit(sl.call()));
    sl.registerFactory<RecentDoctorsCubit>(() => RecentDoctorsCubit(sl.call()));

    //Doctor Detail cubits
    sl.registerFactory<DateSelectorCubit>(() => DateSelectorCubit());
    sl.registerFactory<TimeSelectorCubit>(() => TimeSelectorCubit());
    sl.registerFactory<UpdateRecentDoctorCubit>(
        () => UpdateRecentDoctorCubit(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///UseCase
    //Auth Use Cases
    sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(sl.call()));
    sl.registerLazySingleton<GoogleSignInUseCase>(
        () => GoogleSignInUseCase(sl.call()));
    sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(sl.call()));
    sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl.call()));

    //Home Use Cases
    sl.registerLazySingleton<FetchHomeTopDoctorsUseCase>(
        () => FetchHomeTopDoctorsUseCase(sl.call()));

    //Find Doctors Use Cases
    sl.registerLazySingleton<FetchRecommendedDoctorUseCase>(
        () => FetchRecommendedDoctorUseCase(sl.call()));
    sl.registerLazySingleton<FetchRecentDoctorsUseCase>(
        () => FetchRecentDoctorsUseCase(sl.call()));

    //Doctor Detail Use Cases
    sl.registerLazySingleton<UpdateRecentDoctorsUseCase>(
        () => UpdateRecentDoctorsUseCase(sl.call()));

    //Profile Use Cases
    sl.registerLazySingleton<FetchProfileInfoUseCase>(
        () => FetchProfileInfoUseCase(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///Repository
    //Auth Repository
    sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl.call()));

    //Home Repository
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl.call()));

    //Find Doctors Repository
    sl.registerLazySingleton<FindDoctorsRepo>(
        () => FindDoctorsRepoImpl(sl.call()));

    //Doctor Detail Repository
    sl.registerLazySingleton<DoctorDetailRepo>(
        () => DoctorDetailRepoImpl(sl.call()));

    //Profile Repository
    sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl.call()));

    //-------------------------------------------------------------------------------------------------//
    ///DataSource
    //Auth DataSource
    sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());

    //Home DataSource
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl());

    //Find Doctors DataSource
    sl.registerLazySingleton<FindDoctorsRemoteDataSource>(
        () => FindDoctorsRemoteDataSourceImpl());

    //Doctor Detail DataSource
    sl.registerLazySingleton<DoctorDetailRemoteDataSource>(
        () => DoctorDetailRemoteDataSourceImpl());

    //Profile DataSource
    sl.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl());
  }
}

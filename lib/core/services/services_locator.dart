import 'package:get_it/get_it.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Cubit
    /// Cubit
    // Doctor Detail cubits
    sl.registerFactory<DateSelectorCubit>(() => DateSelectorCubit());
    sl.registerFactory<TimeSelectorCubit>(() => TimeSelectorCubit());





    //-------------------------------------------------------------------------------------------------//
    ///UseCase



    //-------------------------------------------------------------------------------------------------//
    ///Repository


    //-------------------------------------------------------------------------------------------------//
    ///DataSource
  }
}

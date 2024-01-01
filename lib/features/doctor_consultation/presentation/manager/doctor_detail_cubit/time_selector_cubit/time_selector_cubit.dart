import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSelectorCubit extends Cubit<DateTime> {
  TimeSelectorCubit() : super(DateTime(2024, 1, 1, 9, 0));

  void selectTimeSlot(DateTime time) {
    emit(time);
  }
}
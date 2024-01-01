import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/time_selector_grid_view.dart';

class TimeSelectorGridViewBlocBuilder extends StatelessWidget {
  const TimeSelectorGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeSelectorCubit, DateTime>(
      builder: (context, selectedTime) {
        return TimeSelectorGridView(
          selectedTime: selectedTime,
        );
      },
    );
  }


}

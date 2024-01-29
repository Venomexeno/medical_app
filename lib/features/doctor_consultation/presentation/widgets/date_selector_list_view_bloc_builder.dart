import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/date_selector_list_view.dart';

class DateSelectorListViewBlocBuilder extends StatelessWidget {
  const DateSelectorListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateSelectorCubit, DateTime>(
      builder: (context, date) {
        DateTime selectedDate = date;

        DateTime startDate =
            selectedDate.subtract(Duration(days: selectedDate.weekday - 1));

        return DateSelectorListView(
            startDate: startDate, selectedDate: selectedDate);
      },
    );
  }
}

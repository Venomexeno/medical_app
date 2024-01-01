import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';

class TimeSelectorGridViewItem extends StatelessWidget {
  const TimeSelectorGridViewItem({
    super.key,
    required this.currentTime,
    required this.isSelected,
  });

  final DateTime currentTime;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TimeSelectorCubit>().selectTimeSlot(currentTime);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE8F3F1)),
          borderRadius: BorderRadius.circular(30.r),
          color: isSelected ? AppColors.green : Colors.transparent,
        ),
        child: Center(
          child: Text(
            _formattedTime(currentTime),
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.black,
              fontSize: 12.sp
            ),
          ),
        ),
      ),
    );
  }

  String _formattedTime(DateTime time) {
    String period = time.hour >= 12 ? 'PM' : 'AM';
    int formattedHour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    return '$formattedHour:${time.minute == 0 ? '00' : time.minute} $period';
  }
}

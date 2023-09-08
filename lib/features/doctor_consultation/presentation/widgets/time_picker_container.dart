import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePickerContainer extends StatelessWidget {
  const TimePickerContainer({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffB3D3CE)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        textAlign: TextAlign.center,
        time,
        style: TextStyle(color: const Color(0xff101623), fontSize: 13.sp),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See all',
            style: TextStyle(fontSize: 14.sp),
          ),
        )
      ],
    );
  }
}

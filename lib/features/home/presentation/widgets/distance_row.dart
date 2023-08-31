import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DistanceRow extends StatelessWidget {
  const DistanceRow({
    super.key,
    required this.distance,
  });

  final int distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Location.svg'),
        const SizedBox(width: 4),
        Text(
          '${distance}m away',
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xffADADAD),
          ),
        ),
      ],
    );
  }
}

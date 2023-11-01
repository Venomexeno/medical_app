import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodContainerWidget extends StatelessWidget {
  const PaymentMethodContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8F3F1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/VISA.svg'),
          TextButton(
            onPressed: () {},
            child: Text(
              'Change',
              style: TextStyle(
                color: const Color(0xffADADAD),
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsRowWidget extends StatelessWidget {
  const PaymentDetailsRowWidget({
    super.key,
    required this.title,
    required this.price,
    this.textStyle,
    this.priceTextColor,
  });

  final String title;
  final double price;
  final TextStyle? textStyle;
  final Color? priceTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ??
              TextStyle(
                color: const Color(0xffA1A8B0),
                fontSize: 14.sp,
              ),
        ),
        price == 0
            ? Text(
          '-',
          style: TextStyle(
            fontSize: 14.sp,
          ),
        )
            : Text(
          '$price LE',
          style: TextStyle(fontSize: 14.sp, color: priceTextColor),
        ),
      ],
    );
  }
}

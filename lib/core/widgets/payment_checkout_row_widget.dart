import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';

class PaymentCheckoutRowWidget extends StatelessWidget {
  const PaymentCheckoutRowWidget({
    super.key,
    required this.buttonText,
    required this.price,
    required this.dialogAssetsIcon,
    required this.dialogTitleText,
    required this.dialogDescriptionText,
    required this.dialogButtonText,
    required this.dialogOnPressed,
  });

  final String buttonText;
  final double price;
  final String dialogAssetsIcon;
  final String dialogTitleText;
  final String dialogDescriptionText;
  final String dialogButtonText;
  final VoidCallback dialogOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total',
              style: TextStyle(
                color: const Color(0xffA1A8B0),
                fontSize: 14.sp,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '$price LE',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 60.w),
        Expanded(
          child: CustomElevatedButtonWidget(
            text: buttonText,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialogWidget(
                    assetsIcon: dialogAssetsIcon,
                    titleText: dialogTitleText,
                    descriptionText: dialogDescriptionText,
                    buttonText: dialogButtonText,
                    onPressed: dialogOnPressed,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

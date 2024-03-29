import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({
    super.key,
    required this.titleText,
    this.descriptionText,
    required this.buttonText,
    required this.onPressed,
    this.cancelButton,
    required this.assetsIcon,
  });

  final String assetsIcon;
  final String titleText;
  final String? descriptionText;
  final String buttonText;
  final VoidCallback onPressed;
  final String? cancelButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      content: Padding(
        padding: const EdgeInsets.only(
          left: 18.5,
          right: 18.5,
          bottom: 38,
          top: 60,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(assetsIcon),
            const SizedBox(height: 40),
            Text(
              textAlign: TextAlign.center,
              titleText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            const SizedBox(height: 8),
            descriptionText != null
                ? Text(
                    descriptionText!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xffA1A8B0),
                    ),
                    textAlign: TextAlign.center,
                  )
                : Container(),
            const SizedBox(height: 24),
            CustomElevatedButtonWidget(
              text: buttonText,
              onPressed: onPressed,
            ),
            cancelButton != null
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(cancelButton!),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

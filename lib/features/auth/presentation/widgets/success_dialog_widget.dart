import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/auth/presentation/widgets/auth_button_widget.dart';

class SuccessDialogWidget extends StatelessWidget {
  const SuccessDialogWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      content: Padding(
        padding:
            const EdgeInsets.only(left: 18.5, right: 18.5, bottom: 38, top: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/Surgeon.svg'),
            const SizedBox(height: 40),
            Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xffA1A8B0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AuthButtonWidget(
                text: 'Login',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.loginPageRoute, (route) => false);
                })
          ],
        ),
      ),
    );
  }
}

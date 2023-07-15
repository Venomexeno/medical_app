import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/features/auth/presentation/widgets/create_password_form_section.dart';
import 'package:medical_app/features/auth/presentation/widgets/success_dialog_widget.dart';

import 'auth_button_widget.dart';

class CreateNewPasswordPageBody extends StatelessWidget {
  CreateNewPasswordPageBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Password',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your new password to login',
              style: TextStyle(
                color: const Color(0xffA1A8B0),
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(height: 24),
            CreatePasswordFormSection(formKey: _formKey),
            const SizedBox(height: 24),
            AuthButtonWidget(
              text: 'Create Password',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SuccessDialogWidget(
                          text: 'You have successfully reset your password.');
                    },
                  );
                } else {
                  print('Unsuccessful');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/features/profile/presentation/widgets/profile_button_row.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.41,
              width: double.infinity,
              color: const Color(0xff45c3b8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://i.ibb.co/NLsLXZb/doctor2.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Amelia Renata',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/images/Lines.svg'),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.48,
          width: double.infinity,
          color: const Color(0xff45c3b8),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  ProfileButtonRow(
                    onPressed: (){},
                    assetsIcon: 'assets/icons/Profile Saved.svg',
                    text: 'My Saved',
                  ),
                  const Divider(),
                  ProfileButtonRow(
                    onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.schedulePageRoute);
                    },
                    assetsIcon: 'assets/icons/Profile Appointment.svg',
                    text: 'Appointment',
                  ),
                  const Divider(),
                  ProfileButtonRow(
                    onPressed: (){},
                    assetsIcon: 'assets/icons/Profile Payment Method.svg',
                    text: 'Payment Method',
                  ),
                  const Divider(),
                  ProfileButtonRow(
                    onPressed: (){},
                    assetsIcon: 'assets/icons/Profile FAQs.svg',
                    text: 'FAQs',
                  ),
                  const Divider(),
                  ProfileButtonRow(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialogWidget(
                            assetsIcon: 'assets/icons/Logout.svg',
                            titleText: 'Are you sure to log out of your account ?',
                            buttonText: 'Log Out',
                            cancelButton: 'Cancel',
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutes.loginPageRoute, (route) => false);
                            },
                          );
                        },
                      );
                    },
                    assetsIcon: 'assets/icons/Profile Logout.svg',
                    text: 'Logout',
                    textColor: const Color(0xffFE5C5C),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/auth_cubit.dart';
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
              height: 245.h,
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
              child: SvgPicture.asset('assets/images/Lines.svg', height: 330.h),
            ),
          ],
        ),
        Expanded(
          child: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    ProfileButtonRow(
                      onPressed: () {},
                      assetsIcon: 'assets/icons/Profile Saved.svg',
                      text: 'My Saved',
                    ),
                    const Divider(),
                    ProfileButtonRow(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.schedulePageRoute);
                      },
                      assetsIcon: 'assets/icons/Profile Appointment.svg',
                      text: 'Appointment',
                    ),
                    const Divider(),
                    ProfileButtonRow(
                      onPressed: () {},
                      assetsIcon: 'assets/icons/Profile Payment Method.svg',
                      text: 'Payment Method',
                    ),
                    const Divider(),
                    ProfileButtonRow(
                      onPressed: () {},
                      assetsIcon: 'assets/icons/Profile FAQs.svg',
                      text: 'FAQs',
                    ),
                    const Divider(),
                    ProfileButtonRow(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r)),
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
                                    SvgPicture.asset('assets/icons/Logout.svg'),
                                    const SizedBox(height: 40),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Are you sure to log out of your account ?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 24),
                                    BlocConsumer<AuthCubit, AuthState>(
                                      listener: (context, state) {
                                        if (state is UnAuthenticated) {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              AppRoutes.loginPageRoute,
                                              (route) => false);
                                        } else if (state
                                            is AuthenticationFailure) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text(state.errMessage)));
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is EmailAndPasswordAuthenticating) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.r)),
                                              minimumSize:
                                                  Size.fromHeight(65.h)),
                                          onPressed: () {
                                            context.read<AuthCubit>().logOut();
                                          },
                                          child: const Text(
                                            'Log Out',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                ),
                              ),
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
        ),
      ],
    );
  }
}

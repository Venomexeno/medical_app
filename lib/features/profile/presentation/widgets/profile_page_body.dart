import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/loading_method.dart';
import 'package:medical_app/features/profile/presentation/controller/profile_info_cubit/profile_info_cubit.dart';
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
              child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
                builder: (context, state) {
                  if (state is ProfileInfoSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: state
                                  .profileInfoEntity.imageUrlEntity.isEmpty
                              ? 'https://firebasestorage.googleapis.com/v0/b/medical-app-624ed.appspot.com/o/users%2Fempty_profile_user.jpg?alt=media&token=937883e4-9b15-4699-ba15-41bd53f8bc97'
                              : state.profileInfoEntity.imageUrlEntity,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          state.profileInfoEntity.nameEntity,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    );
                  } else if (state is ProfileInfoFailure) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
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
                                        if (state is Authenticating) {
                                          if (state.loadingMethod ==
                                              LoadingMethod.logOut) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/nav_bar_items.dart';
import 'package:medical_app/core/functions/services_locator.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/schedule_page.dart';
import 'package:medical_app/features/home/presentation/controller/home_cubits/home_top_doctors_cubit/home_top_doctors_cubit.dart';
import 'package:medical_app/features/home/presentation/controller/root_cubits/root_navigation_cubit/navigation_cubit.dart';
import 'package:medical_app/features/home/presentation/pages/home_page.dart';
import 'package:medical_app/features/profile/presentation/controller/profile_info_cubit/profile_info_cubit.dart';
import 'package:medical_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return SizedBox(
            height: 65.h,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: state.index,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/Home.svg',
                    height: 25.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/Home.svg',
                    height: 25.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.green,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/Calendar.svg',
                    height: 25.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/Calendar.svg',
                    height: 25.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.green,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/Profile.svg',
                    height: 25.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/Profile.svg',
                    height: 25.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.green,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.calendar);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            ),
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return BlocProvider<HomeTopDoctorsCubit>(
              create: (context) => sl<HomeTopDoctorsCubit>()..fetchTopDoctors(),
              child: const HomePage(),
            );
          } else if (state.navbarItem == NavbarItem.calendar) {
            return const SchedulePage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return BlocProvider<ProfileInfoCubit>(
              create: (context) => sl<ProfileInfoCubit>()
                ..fetchProfileInfo(uid: 'Kx4AH6SvSsMNUH4DUHEv1mGHdC02'),
              child: const ProfilePage(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

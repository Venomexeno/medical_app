import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/nav_bar_items.dart';
import 'package:medical_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/schedule_page.dart';
import 'package:medical_app/features/home/presentation/controller/navigation_cubit.dart';
import 'package:medical_app/features/home/presentation/pages/home_page.dart';
import 'package:medical_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.uid,
  });

  final String uid;

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
                  icon: SvgPicture.asset('assets/icons/Profile.svg'),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/Profile.svg',
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
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.calendar) {
            return const SchedulePage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return const ProfilePage();
          }
          return Container();
        },
      ),
    );
  }
}

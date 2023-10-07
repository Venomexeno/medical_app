import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:medical_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:medical_app/features/auth/presentation/pages/login_page.dart';
import 'package:medical_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:medical_app/features/auth/presentation/pages/verification_code_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/doctor_detail_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/find_doctors_page.dart';
import 'package:medical_app/features/home/presentation/pages/home_page.dart';
import 'package:medical_app/features/home/presentation/pages/root_page.dart';
import 'package:medical_app/features/home/presentation/pages/top_doctors_page.dart';
import 'package:medical_app/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/drugs_detail_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/my_cart_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/online_pharmacy_page.dart';

import 'features/doctor_consultation/presentation/pages/doctor_appointment_booking_page.dart';
import 'features/home/presentation/controller/navigation_cubit.dart';

class OnGenerateRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingPageRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );

      case AppRoutes.loginPageRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
          settings: settings,
        );

      case AppRoutes.forgotPasswordPageRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
          settings: settings,
        );

      case AppRoutes.verificationCodePageRoute:
        return MaterialPageRoute(
          builder: (_) => const VerificationCodePage(),
          settings: settings,
        );

      case AppRoutes.createNewPasswordPageRoute:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordPage(),
          settings: settings,
        );

      case AppRoutes.rootPageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NavigationCubit>(
              create: (context) => NavigationCubit(), child: const RootPage()),
          settings: settings,
        );

      case AppRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case AppRoutes.topDoctorsPageRoute:
        return MaterialPageRoute(
          builder: (_) => const TopDoctorsPage(),
          settings: settings,
        );

      case AppRoutes.findDoctorsPageRoute:
        return MaterialPageRoute(
          builder: (_) => const FindDoctorsPage(),
          settings: settings,
        );

      case AppRoutes.doctorDetailPageRoute:
        return MaterialPageRoute(
          builder: (_) => const DoctorDetailPage(),
          settings: settings,
        );

      case AppRoutes.doctorAppointmentBookingPageRoute:
        return MaterialPageRoute(
          builder: (_) => const DoctorAppointmentBookingPage(),
          settings: settings,
        );

      case AppRoutes.onlinePharmacyPageRoute:
        return MaterialPageRoute(
          builder: (_) => const OnlinePharmacyPage(),
          settings: settings,
        );

      case AppRoutes.drugsDetailPageRoute:
        return MaterialPageRoute(
          builder: (_) => const DrugsDetailPage(),
          settings: settings,
        );

      case AppRoutes.myCartPageRoute:
        return MaterialPageRoute(
          builder: (_) => const MyCartPage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
          settings: settings,
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: const Center(
        child: Text("Error Page"),
      ),
    );
  }
}

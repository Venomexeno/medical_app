import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/functions/services_locator.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:medical_app/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:medical_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:medical_app/features/auth/presentation/pages/login_page.dart';
import 'package:medical_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:medical_app/features/auth/presentation/pages/verification_code_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/date_selector_cubit/date_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/manager/doctor_detail_cubit/time_selector_cubit/time_selector_cubit.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/doctor_detail_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/find_doctors_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/schedule_page.dart';
import 'package:medical_app/features/home/presentation/pages/health_article_page.dart';
import 'package:medical_app/features/home/presentation/pages/home_page.dart';
import 'package:medical_app/features/home/presentation/pages/root_page.dart';
import 'package:medical_app/features/home/presentation/pages/top_doctors_page.dart';
import 'package:medical_app/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/drugs_detail_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/my_cart_page.dart';
import 'package:medical_app/features/online_pharmacy/presentation/pages/online_pharmacy_page.dart';
import 'package:medical_app/features/doctor_consultation/presentation/pages/doctor_appointment_booking_page.dart';
import 'package:medical_app/features/home/presentation/controller/navigation_cubit.dart';

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
          builder: (_) => BlocProvider<SignUpCubit>(
            create: (context) => sl<SignUpCubit>(),
            child: const SignUpPage(),
          ),
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
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<NavigationCubit>(
                create: (context) => NavigationCubit(),
              ),
              BlocProvider<AuthCubit>(
                create: (context) => sl<AuthCubit>(),
              ),
            ],
            child: const RootPage(),
          ),
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<TimeSelectorCubit>(
                create: (context) => sl<TimeSelectorCubit>(),
              ),
              BlocProvider<DateSelectorCubit>(
                create: (context) => sl<DateSelectorCubit>(),
              ),
            ],
            child: const DoctorDetailPage(),
          ),
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

      case AppRoutes.schedulePageRoute:
        return MaterialPageRoute(
          builder: (_) => const SchedulePage(),
          settings: settings,
        );

      case AppRoutes.healthArticlePageRoute:
        return MaterialPageRoute(
          builder: (_) => const HealthArticlePage(),
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

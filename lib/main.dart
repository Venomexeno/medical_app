import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/functions/services_locator.dart';
import 'package:medical_app/features/auth/presentation/controller/sign_in_cubit/auth_cubit.dart';
import 'package:medical_app/firebase_options.dart';
import 'package:medical_app/onGenerateRoute.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
          child: MaterialApp(
            onGenerateRoute: OnGenerateRoute.routes,
            initialRoute: AppRoutes.onBoardingPageRoute,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: AppColors.white,
              colorScheme: ThemeData().colorScheme.copyWith(
                primary: AppColors.green,
              ),
              textTheme: GoogleFonts.interTextTheme(
                ThemeData
                    .light()
                    .textTheme,
              ),
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

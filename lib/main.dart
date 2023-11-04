import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/services/services_locator.dart';
import 'package:medical_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/credential/credential_cubit.dart';
import 'package:medical_app/onGenerateRoute.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                  create: (_) => sl<AuthCubit>()..appStared()),
              BlocProvider<CredentialCubit>(
                  create: (_) => sl<CredentialCubit>()),
            ],
            child: MaterialApp(
              onGenerateRoute: OnGenerateRoute.routes,
              initialRoute: AppRoutes.onBoardingPageRoute,
              title: 'Flutter Demo',
              theme: ThemeData.light().copyWith(
                  scaffoldBackgroundColor: AppColors.white,
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: AppColors.green,
                      ),
                  textTheme:
                      GoogleFonts.interTextTheme(ThemeData.light().textTheme)),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}

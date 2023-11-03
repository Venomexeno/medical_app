import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_colors.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/onGenerateRoute.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode,
      tools: const [
        ...DevicePreview.defaultTools
      ],
      builder: (context) => ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
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
          );
        },
      ),
    );
  }
}

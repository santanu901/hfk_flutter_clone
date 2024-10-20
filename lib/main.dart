import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hfk_flutter_clone/core/app_routes.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/ui/dashboard/dashboard_screen.dart';
import 'package:hfk_flutter_clone/ui/home/home_screen.dart';
import 'package:hfk_flutter_clone/ui/login/login_screen.dart';
import 'package:hfk_flutter_clone/ui/register/register_screen.dart';
import 'package:hfk_flutter_clone/ui/splash/splash_screen.dart';
import 'package:hfk_flutter_clone/ui/verify_otp/verify_otp_screen.dart';

void main() {
  runApp(const HFKApp());
}

class HFKApp extends StatelessWidget {
  const HFKApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.forestGreen, // Status bar color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HFK',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteSmoke,
        fontFamily: 'Urbanist',
        brightness: Brightness.light,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.verifyOtp: (context) => const VerifyOtpScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}


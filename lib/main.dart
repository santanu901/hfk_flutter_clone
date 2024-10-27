import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hfk_flutter_clone/core/app_routes.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/ui/dashboard/dashboard_screen.dart';
import 'package:hfk_flutter_clone/ui/home/home_screen.dart';
import 'package:hfk_flutter_clone/ui/login/login_screen.dart';
import 'package:hfk_flutter_clone/ui/register/register_screen.dart';
import 'package:hfk_flutter_clone/ui/splash/splash_screen.dart';
import 'package:hfk_flutter_clone/ui/verify_otp/verify_otp_screen.dart';
import 'package:hfk_flutter_clone/ui/web_view/web_view_screen.dart';

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

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HFK',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteSmoke,
        fontFamily: 'Urbanist',
        brightness: Brightness.light,
      ),
      initialRoute: AppRoutes.splash,
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
        GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
        GetPage(name: AppRoutes.verifyOtp, page: () => const VerifyOtpScreen()),
        GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen()),
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.webView, page: () => const WebViewScreen()),
      ],
    );
  }
}


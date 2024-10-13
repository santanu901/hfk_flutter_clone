import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/core/app_routes.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initSplashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.americanGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWelcomeLabel(),
            _buildItemSpacingVertical(AppDimens.size_16),
            _buildCompanyLogo(),
            _buildItemSpacingVertical(AppDimens.size_16),
            _buildCompanyNameLabel()
          ],
        ),
      ),
    );
  }

  ///UI Builder
  Widget _buildItemSpacingVertical(double boxHeight) {
    return SizedBox(
      height: boxHeight,
    );
  }

  Widget _buildWelcomeLabel() {
    return Text(
      AppStrings.splashWelcomeMsg,
      style: ThemeText.font29Bold.apply(color: AppColors.white),
    );
  }

  Widget _buildCompanyLogo() {
    return SizedBox(
      width: AppDimens.size_120,
      height: AppDimens.size_120,
      child: Image.asset(AppIcons.icHfkCompanyLogo),
    );
  }

  Widget _buildCompanyNameLabel() {
    return Text(
      AppStrings.appFullName,
      style: ThemeText.font29Bold.apply(color: AppColors.white),
    );
  }

  ///UI Functionality
  void initSplashTimer() {
    Timer(const Duration(milliseconds: AppConstants.milliSeconds3000), () {
      navigateToDashboard();
    });
  }

  ///Navigation Handler
  void navigateToDashboard() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }
}

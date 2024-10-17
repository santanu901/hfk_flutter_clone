import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hfk_flutter_clone/custom_views/custom_text_field.dart';
import 'package:hfk_flutter_clone/enums/enum_login_type.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_button.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:hfk_flutter_clone/utils/common_utils.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late final TextEditingController mInputFullNameController;
  late final TextEditingController mInputMobileController;
  late final Timer mCountdownTimer;

  var selectedUserType = UserType.None;
  var mResendTimerCount = 45;

  @override
  void initState() {
    super.initState();
    mInputFullNameController = TextEditingController();
    mInputMobileController = TextEditingController();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    mInputFullNameController.dispose();
    mInputMobileController.dispose();
    stopTimer();
  }

  void startTimer() {
    mCountdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        mResendTimerCount--;
      });

      if (mResendTimerCount < 1) {
        mCountdownTimer.cancel();
      }
    });
  }

  void stopTimer() {
    if (mCountdownTimer.isActive) {
      mCountdownTimer.cancel();
    }
  }

  bool isResendCountdownTimerOff() {
    return (mResendTimerCount < 1) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildItemSpacingVertical(AppDimens.size_64),
              _buildPasswordAccessLogoHeader(),
              _buildItemSpacingVertical(AppDimens.size_16),
              _buildVerificationLabel(),
              _buildNotReceivedCodeLabel(),
              _buildItemSpacingVertical(AppDimens.size_48),
              _buildOTPItemField(),
              _buildItemSpacingVertical(AppDimens.size_48),
              _buildVerifyButton(),
              _buildItemSpacingVertical(AppDimens.size_32),
              _buildNotReceivedOtpLabel(),
              _buildResendItemRow(),
            ],
          ),
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

  Widget _buildItemSpacingHorizontal(double boxWidth) {
    return SizedBox(
      width: boxWidth,
    );
  }

  Widget _buildPasswordAccessLogoHeader() {
    return SizedBox(
      width: AppDimens.size_120,
      height: AppDimens.size_120,
      child: Image.asset(AppIcons.icPasswordAccess),
    );
  }

  Widget _buildVerificationLabel() {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: Text(
        AppStrings.labelVerification,
        style: ThemeText.font29Bold,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNotReceivedCodeLabel() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: Text(
        AppStrings.labelEnterOtpCode,
        style: ThemeText.font13Light.apply(color: AppColors.payneGrey),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOTPItemField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_24,
        right: AppDimens.size_24,
      ),
      child: OtpTextField(
          numberOfFields: 4,
          fieldWidth: AppDimens.size_48,
          fieldHeight: AppDimens.size_52,
          margin: const EdgeInsets.only(right: AppDimens.size_16),
          borderColor: AppColors.darkSilver,
          focusedBorderColor: AppColors.americanGreen,
          showFieldAsBox: true,
          borderWidth: 4.0,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here if necessary
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            print("Verification Code: $verificationCode");
          }),
    );
  }

  Widget _buildVerifyButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_24,
        right: AppDimens.size_24,
      ),
      child: ElevatedButton(
        onPressed: () {
          registerClickHandler();
        },
        style: ThemeButton.buttonStyleElevatedSolidRoundedCurveAmericanGreen,
        child: Text(
          AppStrings.labelVerify,
          style: ThemeText.font19SemiBold.apply(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildNotReceivedOtpLabel() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: Text(
        AppStrings.labelNotReceiveCodeLabel,
        style: ThemeText.font13Light.apply(color: AppColors.payneGrey),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildResendItemRow() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildResendLabel(),
          _buildResendTimerLabel(),
        ],
      ),
    );
  }

  Widget _buildResendLabel() {
    return TextButton(
      onPressed:
          isResendCountdownTimerOff() ? () => resendClickHandler() : null,
      child: Text(
        AppStrings.labelResend,
        style: ThemeText.font17SemiBold.apply(color: AppColors.americanGreen),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildResendTimerLabel() {
    return isResendCountdownTimerOff()
        ? _buildItemSpacingHorizontal(AppDimens.size_0)
        : Text(
            "${AppStrings.labelResendIn} ${mResendTimerCount.toString().padLeft(2, "0")} Seconds",
            style: ThemeText.font15Regular,
          );
  }

  ///Navigation Handler
  void navigateToBackStack() {
    Navigator.of(context).pop();
  }

  ///Click Handler
  void registerClickHandler() {
    CommonUtils.hideSoftKeyboard();
  }

  void resendClickHandler() {
    CommonUtils.hideSoftKeyboard();
    mResendTimerCount = 45;
    startTimer();
  }
}

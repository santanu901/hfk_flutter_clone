import 'package:flutter/material.dart';
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
  late final TextEditingController inputFullNameController;
  late final TextEditingController inputMobileController;

  var selectedUserType = UserType.None;

  @override
  void initState() {
    super.initState();
    inputFullNameController = TextEditingController();
    inputMobileController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    inputFullNameController.dispose();
    inputMobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildVerificationLabel(),
            _buildNotReceivedCodeLabel(),
            _buildItemSpacingVertical(AppDimens.size_48),
            _buildOTPItemRow(),
            _buildItemSpacingVertical(AppDimens.size_48),
            _buildVerifyButton(),
            _buildItemSpacingVertical(AppDimens.size_24),
            _buildNotReceivedOtpLabel(),
            _buildResendLabel(),
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

  Widget _buildItemSpacingHorizontal(double boxWidth) {
    return SizedBox(
      width: boxWidth,
    );
  }

  Widget _buildVerificationLabel() {
    return const Padding(
      padding:
          EdgeInsets.only(left: AppDimens.size_16, right: AppDimens.size_16),
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
          left: AppDimens.size_16, right: AppDimens.size_16),
      child: Text(
        AppStrings.labelEnterOtpCode,
        style: ThemeText.font13Light.apply(color: AppColors.payneGrey),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOTPItemRow() {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.size_16, right: AppDimens.size_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildOTPItemField(first: true, last: false),
          _buildItemSpacingHorizontal(AppDimens.size_12),
          _buildOTPItemField(first: false, last: false),
          _buildItemSpacingHorizontal(AppDimens.size_12),
          _buildOTPItemField(first: false, last: false),
          _buildItemSpacingHorizontal(AppDimens.size_12),
          _buildOTPItemField(first: false, last: true),
        ],
      ),
    );
  }

  Widget _buildOTPItemField({bool first = false, last = false}) {
    return SizedBox(
      height: AppDimens.size_48,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: ThemeText.font15Medium,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: AppDimens.size_2, color: Colors.black12),
                borderRadius: BorderRadius.circular(AppDimens.size_12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: AppDimens.size_2, color: AppColors.americanGreen),
                borderRadius: BorderRadius.circular(AppDimens.size_12)),
          ),
        ),
      ),
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
          left: AppDimens.size_16, right: AppDimens.size_16),
      child: Text(
        AppStrings.labelNotReceiveCodeLabel,
        style: ThemeText.font13Light.apply(color: AppColors.payneGrey),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildResendLabel() {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.size_16, right: AppDimens.size_16),
      child: Text(
        AppStrings.labelResend,
        style: ThemeText.font17SemiBold.apply(color: AppColors.americanGreen),
        textAlign: TextAlign.center,
      ),
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
}

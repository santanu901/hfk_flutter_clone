import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hfk_flutter_clone/custom_views/custom_text_field.dart';
import 'package:hfk_flutter_clone/enums/enum_login_type.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_button.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:hfk_flutter_clone/utils/common_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemSpacingVertical(AppDimens.size_48),
              _buildRegisterHeaderBack(),
              _buildItemSpacingVertical(AppDimens.size_32),
              _buildRegisterLabel(),
              _buildItemSpacingVertical(AppDimens.size_16),
              _buildRegisterUserTypeLabel(),
              _buildItemSpacingVertical(AppDimens.size_2),
              _buildRegisterUserTypeRadio(),
              _buildItemSpacingVertical(AppDimens.size_16),
              _buildFullNameField(),
              _buildItemSpacingVertical(AppDimens.size_16),
              _buildMobileNoField(),
              _buildItemSpacingVertical(AppDimens.size_48),
              _buildRegisterButton(),
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

  Widget _buildRegisterHeaderBack() {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.size_8),
      child: IconButton(
        onPressed: () {
          navigateToBack();
        },
        icon: const Icon(
          Icons.arrow_back,
          size: AppDimens.size_36,
        ),
      ),
    );
  }

  Widget _buildRegisterLabel() {
    return const Padding(
      padding: EdgeInsets.only(left: AppDimens.size_16),
      child: Text(
        AppStrings.labelRegister,
        style: ThemeText.font29Bold,
      ),
    );
  }

  Widget _buildRegisterUserTypeLabel() {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppDimens.size_16,
      ),
      child: Text(
        AppStrings.labelRegisterUserType,
        style: ThemeText.font19Regular,
      ),
    );
  }

  Widget _buildRegisterUserTypeRadio() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_8,
      ),
      child: Row(
        children: [
          Radio(
              value: UserType.Buyer,
              groupValue: selectedUserType,
              activeColor: AppColors.americanGreen,
              onChanged: (value) {
                setState(() {
                  selectedUserType = UserType.Buyer;
                });
              }),
          const Text(
            AppStrings.labelRegisterTypeBuyer,
            style: ThemeText.font15Regular,
          ),
          _buildItemSpacingHorizontal(AppDimens.size_8),
          Radio(
              value: UserType.Seller,
              groupValue: selectedUserType,
              activeColor: AppColors.americanGreen,
              onChanged: (value) {
                setState(() {
                  selectedUserType = UserType.Seller;
                });
              }),
          const Text(
            AppStrings.labelRegisterTypeSeller,
            style: ThemeText.font15Regular,
          )
        ],
      ),
    );
  }

  Widget _buildFullNameField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: CustomTextField(
        labelText: AppStrings.labelFullName,
        hintText: AppStrings.hintEnterFullName,
        maxLength: 50,
        inputController: inputFullNameController,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _buildMobileNoField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: CustomTextField(
        labelText: AppStrings.labelMobileNumber,
        hintText: AppStrings.hintEnterMobileNo,
        maxLength: 10,
        inputController: inputMobileController,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildRegisterButton() {
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
          AppStrings.labelRegister,
          style: ThemeText.font19SemiBold.apply(color: AppColors.white),
        ),
      ),
    );
  }

  ///Navigation Handler
  void navigateToBack() {
    Get.back();
  }

  ///Click Handler
  void registerClickHandler() {
    CommonUtils.hideSoftKeyboard();
  }
}

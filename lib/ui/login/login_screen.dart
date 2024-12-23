import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hfk_flutter_clone/core/app_routes.dart';
import 'package:hfk_flutter_clone/custom_views/custom_text_field.dart';
import 'package:hfk_flutter_clone/enums/enum_login_type.dart';
import 'package:hfk_flutter_clone/model/login/login_request_model.dart';
import 'package:hfk_flutter_clone/networking/api_response.dart';
import 'package:hfk_flutter_clone/networking/api_response_status.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/resources/app_icons.dart';
import 'package:hfk_flutter_clone/resources/app_strings.dart';
import 'package:hfk_flutter_clone/services/services_locator.dart';
import 'package:hfk_flutter_clone/services/shared_prefs_service.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_button.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:hfk_flutter_clone/ui/login/login_viewmodel.dart';
import 'package:hfk_flutter_clone/utils/alert_utils.dart';
import 'package:hfk_flutter_clone/utils/common_utils.dart';
import 'package:hfk_flutter_clone/utils/validation_utils.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController inputMobileController;

  final sharedPrefService = serviceLocator<SharedPrefsService>();
  final LoginViewModel loginViewModel = Get.put(LoginViewModel());
  final mLogger = Logger();

  var selectedLoginType = UserType.None;
  var inputMobile = "";

  @override
  void initState() {
    super.initState();
    inputMobileController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    inputMobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        if (loginViewModel.loginResponseObserver.value.status ==
            APIResponseStatus.LOADING) {
          return _buildCircularLoader();
        } else if (loginViewModel.loginResponseObserver.value.status ==
            APIResponseStatus.ERROR) {
          mLogger.e("Inside On Error");
          mLogger.e("Error Data: ${loginViewModel.loginResponseObserver.value.message}");
          return _buildLoginForm();
        } else if (loginViewModel.loginResponseObserver.value.status ==
            APIResponseStatus.COMPLETED) {
          //AlertUtils.showSuccessSnackBar(context, loginViewModel.loginResponseObserver.value.data?.message ?? "");
          mLogger.e("Inside On Success");
          var loginResponseModel = loginViewModel.loginResponseObserver.value.data;
          if(loginResponseModel != null) {
            mLogger.e("Success Data: ${loginResponseModel.message}");
            mLogger.e("Success Data: ${loginResponseModel.success}");
            mLogger.e("Success Data: ${loginResponseModel.userData?.toJson()}");
          }

          return _buildLoginForm();
        } else {
          return _buildLoginForm();
        }
      }),
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

  Widget _buildCircularLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLoginHeader(),
            _buildItemSpacingVertical(AppDimens.size_32),
            _buildLoginTypeLabel(),
            _buildItemSpacingVertical(AppDimens.size_2),
            _buildLoginTypeRadio(),
            _buildItemSpacingVertical(AppDimens.size_12),
            _buildMobileNoField(),
            _buildItemSpacingVertical(AppDimens.size_48),
            _buildLoginInButton(),
            _buildItemSpacingVertical(AppDimens.size_32),
            _buildNoAccountLabel(),
            _buildItemSpacingVertical(AppDimens.size_16),
            _buildCreateAccount(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginHeader() {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.35,
      child: Stack(
        children: [
          _buildLoginHeaderStackBg(),
          _buildLoginHeaderStackAppNameNLogo(),
          _buildLoginHeaderStackLoginLabel(),
        ],
      ),
    );
  }

  Widget _buildLoginHeaderStackBg() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        AppIcons.icLoginTop,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildLoginHeaderStackAppNameNLogo() {
    return Padding(
      padding: const EdgeInsets.only(
          right: AppDimens.size_24, bottom: AppDimens.size_24),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppStrings.appFullName,
              style: ThemeText.font21SemiBold.apply(color: AppColors.white),
            ),
            const SizedBox(
              height: AppDimens.size_84,
              child: VerticalDivider(
                color: AppColors.lightSilver,
                thickness: 1,
                indent: AppDimens.size_24,
                endIndent: AppDimens.size_24,
              ),
            ),
            SizedBox(
              width: AppDimens.size_64,
              height: AppDimens.size_64,
              child: Image.asset(AppIcons.icHfkCompanyLogo),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginHeaderStackLoginLabel() {
    return const Padding(
        padding: EdgeInsets.only(
          left: AppDimens.size_16,
          bottom: AppDimens.size_16,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.labelLogin,
            style: TextStyle(
                fontSize: AppDimens.fontSize_25,
                fontWeight: FontWeight.w600,
                color: AppColors.americanGreen,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.americanGreen,
                decorationThickness: AppDimens.size_4),
          ),
        ));
  }

  Widget _buildLoginTypeLabel() {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppDimens.size_16,
      ),
      child: Text(
        AppStrings.labelLoginType,
        style: ThemeText.font19Regular,
      ),
    );
  }

  Widget _buildLoginTypeRadio() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_8,
      ),
      child: Row(
        children: [
          Radio(
              value: UserType.Buyer,
              groupValue: selectedLoginType,
              activeColor: AppColors.americanGreen,
              onChanged: (value) {
                setState(() {
                  selectedLoginType = UserType.Buyer;
                });
              }),
          const Text(
            AppStrings.labelLoginTypeBuyer,
            style: ThemeText.font15Regular,
          ),
          _buildItemSpacingHorizontal(AppDimens.size_8),
          Radio(
              value: UserType.Seller,
              groupValue: selectedLoginType,
              activeColor: AppColors.americanGreen,
              onChanged: (value) {
                setState(() {
                  selectedLoginType = UserType.Seller;
                });
              }),
          const Text(
            AppStrings.labelLoginTypeSeller,
            style: ThemeText.font15Regular,
          )
        ],
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

  Widget _buildLoginInButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_24,
        right: AppDimens.size_24,
      ),
      child: ElevatedButton(
        onPressed: () {
          loginClickHandler();
        },
        style: ThemeButton.buttonStyleElevatedSolidRoundedCurveAmericanGreen,
        child: Text(
          AppStrings.labelLogin,
          style: ThemeText.font19SemiBold.apply(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildNoAccountLabel() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
        right: AppDimens.size_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            AppStrings.labelNotHaveAccount,
            style: ThemeText.font15Regular,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: AppDimens.size_8),
              child: const Divider(
                height: AppDimens.size_2,
                color: AppColors.lightSlateGrey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.size_16,
      ),
      child: OutlinedButton(
        onPressed: () {
          createAccountClickHandler();
        },
        style: ThemeButton.buttonStyleOutlineRoundedCurveAmericanGreen,
        child: Text(
          AppStrings.labelCreateAccount,
          style: ThemeText.font17SemiBold.apply(color: AppColors.americanGreen),
        ),
      ),
    );
  }

  ///UI Functionality
  void collectLoginData() {
    inputMobile = inputMobileController.text;
  }

  bool validateLoginData() {
    collectLoginData();

    if (inputMobile.isEmpty) {
      AlertUtils.showErrorSnackBar(
          context, AppStrings.validationMobileEmptyMsg);
      return false;
    }

    return true;
  }

  ///Navigation Handler
  void navigateToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  void navigateToVerifyOTP() {
    Get.toNamed(AppRoutes.verifyOtp);
  }

  ///Click Handler
  void loginClickHandler() {
    CommonUtils.hideSoftKeyboard();
    if (validateLoginData()) {
      var loginRequest = LoginRequestModel(
          mobile: inputMobile, userType: "SLR");
      loginViewModel.callLoginApi(loginRequestModel: loginRequest);
      //navigateToVerifyOTP();
    }
  }

  void createAccountClickHandler() {
    CommonUtils.hideSoftKeyboard();
    navigateToRegister();
  }
}

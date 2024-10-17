class AppStrings {
  ///AppColors._(); is a private constructor which prevents the class from being instantiated.
  AppStrings._();

  static const String appFullName = "Help For Kisan";

  ///Splash Screen Msg
  static const String splashWelcomeMsg = "Welcome To";

  ///Login Screen Msg
  static const String labelLogin = "Login";
  static const String labelLoginType = "Login Type";
  static const String labelLoginTypeBuyer = "Buyer";
  static const String labelLoginTypeSeller = "Seller";
  static const String labelMobileNumber = "Mobile Number";
  static const String labelNotHaveAccount = "Don't have an account yet?";
  static const String labelCreateAccount = "Create Account";

  ///Register Screen Msg
  static const String labelRegister = "Register";
  static const String labelRegisterUserType = "User Type";
  static const String labelRegisterTypeBuyer = "Buyer";
  static const String labelRegisterTypeSeller = "Seller";
  static const String labelFullName = "Full Name";

  ///Verify Otp Screen Msg
  static const String labelVerification = "Verification";
  static const String labelEnterOtpCode = "Enter your otp code";
  static const String labelVerify = "Verify";
  static const String labelNotReceiveCodeLabel = "Didn't Receive the code?";
  static const String labelResend = "Resend";
  static const String labelResendIn = "In";

  ///Hint Msg
  static const String hintEnterMobileNo = "Enter Mobile Number";
  static const String hintEnterFullName = "Enter Full Name";
  static const String hintUSDCode = "USD Code";

  ///Validation Msg
  static const String validationFullNameEmptyMsg = "Enter Full Name";
  static const String validationMobileEmptyMsg = "Enter Mobile No.";
  static const String validationPasswordEmptyMsg = "Enter Password";
  static const String validationConfirmPasswordEmptyMsg = "Enter Confirm Password";
  static const String validationPasswordTooShortMsg = "Password Too Short";
  static const String validationPasswordNotSameMsg = "Password & Confirm Password Doesn't Match";
}
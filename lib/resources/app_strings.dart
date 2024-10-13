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

  ///Hint Msg
  static const String hintEnterMobileNo = "Enter Mobile Number";

  ///Validation Msg
  static const String validationFirstNameEmptyMsg = "Enter First Name";
  static const String validationLastNameEmptyMsg = "Enter Last Name";
  static const String validationEmailEmptyMsg = "Enter Email";
  static const String validationMobileEmptyMsg = "Enter Mobile No.";
  static const String validationPasswordEmptyMsg = "Enter Password";
  static const String validationConfirmPasswordEmptyMsg = "Enter Confirm Password";
  static const String validationPasswordTooShortMsg = "Password Too Short";
  static const String validationPasswordNotSameMsg = "Password & Confirm Password Doesn't Match";
}
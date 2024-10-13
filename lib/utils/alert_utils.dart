import 'package:flutter/material.dart';
import 'package:hfk_flutter_clone/core/app_constants.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';

class AlertUtils {
  ///AlertUtils._(); is a private constructor which prevents the class from being instantiated.
  AlertUtils._();

  static showErrorSnackBar(BuildContext context, String msg) {
    final errorSnackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: AppDimens.fontSize_15),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: AppConstants.milliSeconds1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
  }

  static showSuccessSnackBar(BuildContext context, String msg) {
    final successSnackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: AppDimens.fontSize_15),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(milliseconds: AppConstants.milliSeconds1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
  }
}

import 'package:flutter/material.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';

import 'app_colors.dart';

class ThemeButton {
  ///ThemeButton._(); is a private constructor which prevents the class from being instantiated.
  ThemeButton._();

  static final ButtonStyle buttonStyleElevatedSolidRoundedCurveAmericanGreen =
      ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppDimens.size_8),
          backgroundColor: AppColors.americanGreen,
          foregroundColor: Colors.black,
          fixedSize: const Size(double.maxFinite, AppDimens.size_48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.size_32),
          ));

  static final ButtonStyle buttonStyleOutlineRoundedCurveAmericanGreen =
      OutlinedButton.styleFrom(
          padding: const EdgeInsets.only(
            left: AppDimens.size_16,
            top: AppDimens.size_8,
            right: AppDimens.size_16,
            bottom: AppDimens.size_8,
          ),
          side: const BorderSide(color: AppColors.americanGreen),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.size_8),
          ));
}

import 'package:flutter/material.dart';
import 'package:hfk_flutter_clone/resources/app_dimens.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int maxLength;
  final bool textEnabled;
  final TextEditingController inputController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.inputController,
      this.maxLength = 50,
      this.textEnabled = true,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      enabled: textEnabled,
      decoration: InputDecoration(
        counter: const Offstage(),
        labelText: labelText,
        hintText: hintText,
        hintMaxLines: 1,
        labelStyle: const TextStyle(color: AppColors.onyx),
        hintStyle: const TextStyle(color: AppColors.onyx),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.size_8)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.americanGreen),
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.size_8)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.americanGreen),
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.size_8)),
        ),
        filled: true,
        fillColor: AppColors.gray82,
      ),
      style: ThemeText.font17Regular.apply(color: AppColors.onyx),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLength: maxLength,
    );
  }
}

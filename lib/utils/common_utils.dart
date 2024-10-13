import 'package:flutter/material.dart';

class CommonUtils {
  static void hideSoftKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
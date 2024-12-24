// core/Style/custom_buttons_style.dart
import 'package:flutter/material.dart';

import '../styles/color_style.dart';
import '../styles/font_style.dart';



class CustomButtonsStyle {
  static final ButtonStyle primeryButtonstyle = ElevatedButton.styleFrom(
      textStyle: TextsStyle.bold16.copyWith(color: AppColors.primaryWhite),
      backgroundColor: AppColors.primaryColor,
      overlayColor: AppColors.grayscale300,
      foregroundColor: AppColors.grayscale300,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ));
  static final ButtonStyle socailAuthButtonstyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(color: Color(0xff0C0D0D)),
      backgroundColor: AppColors.primaryWhite,
      overlayColor: AppColors.primaryColor,
      foregroundColor: AppColors.primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xffDDDFDF)),
        borderRadius: BorderRadius.circular(10),
      ));
  static final ButtonStyle itembuttonstyle = ElevatedButton.styleFrom(
      textStyle: TextsStyle.bold13.copyWith(color: AppColors.primaryColor),
      backgroundColor: AppColors.white,
      overlayColor: AppColors.grayscale300,
      foregroundColor: AppColors.grayscale300,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ));
}

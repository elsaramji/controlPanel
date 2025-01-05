// components/auth/signin/widget/sigin_button.dart
import 'package:flutter/material.dart';

import '../../../../core/custom/buttons/custom_button.dart';
import '../../../../core/styles/color_style.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.onPressed,
    super.key,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      titel: 'تسجيل الدخول',
      onPressed: onPressed,
      titelcolor: AppColors.white,
    );
  }
}

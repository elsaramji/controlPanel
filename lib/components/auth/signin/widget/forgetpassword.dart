// components/auth/signin/widget/forgetpassword.dart
import 'package:flutter/material.dart';

import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../../forgetpassword/view/forget_password_viwe.dart';




class NavigateForgetpassword extends StatelessWidget {
  const NavigateForgetpassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ForgetPasswordViwe.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "نسيت كلمة المرور؟",
            style: TextsStyle.semibold13.copyWith(color: AppColors.green1600),
          ),
        ],
      ),
    );
  }
}

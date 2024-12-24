// components/auth/signin/widget/admin_rules.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furits_control/core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class AdminsRules extends StatelessWidget {
  const AdminsRules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          TextSpan(
            text:
                'يجب ان يكون لديك حساب مسوؤل من قبل ادارة البرنامج اذا كنت ترغب في تسجيل حساب مسوؤل ؟  ',
            style: TextsStyle.regular16.copyWith(color: AppColors.grayscale700),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'توصل معنا',
            style: TextsStyle.semibold16.copyWith(color: AppColors.green1600),
          ),
        ],
      ),
    );
  }
}

// components/auth/signin/widget/signinform.dart
import 'package:flutter/material.dart';
import 'package:furits_control/components/auth/signin/widget/forgetpassword.dart';
import 'package:furits_control/components/auth/signin/widget/sigin_button.dart';

import '../../../../core/constant/ui_items.dart';
import '../../../../core/custom/widget/custom_text_filed.dart';

class SigninForm extends StatelessWidget {
  SigninForm({
    super.key,
  });

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextformField(
            keybordetepy: TextInputType.emailAddress,
            hinttext: 'البريد الالكتروني',
            onsaved: (value) => email = value!,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextformField(
            keybordetepy: TextInputType.visiblePassword,
            hinttext: 'كلمة المرور',
            obscuretext: true,
            suffixicons: Items.visiibleIcons,
            onsaved: (value) => password = value!,
          ),
          const SizedBox(
            height: 16,
          ),
          const NavigateForgetpassword(),
          const SizedBox(
            height: 16,
          ),
          SignInButton(formkey: formkey, email: email, password: password),
        ],
      ),
    );
  }
}

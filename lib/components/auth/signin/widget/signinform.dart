// components/auth/signin/widget/signinform.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/auth/signin/widget/forgetpassword.dart';
import 'package:furits_control/components/auth/signin/widget/sigin_button.dart';


import '../../../../core/custom/inputsfileds/custom_text_filed.dart';
import '../../../../core/custom/inputsfileds/logic/function.dart';
import '../../../../service/blocks/cubits/sginin_cubit/siginin_cubit_cubit.dart';

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
            suffixicons: VisibilIconsInFelides.visiibleIcons,
            onsaved: (value) => password = value!,
          ),
          const SizedBox(
            height: 16,
          ),
          const NavigateForgetpassword(),
          const SizedBox(
            height: 16,
          ),
          SignInButton(onPressed: () async {
            formkey.currentState!.save();
            await BlocProvider.of<SigninCubit>(context)
                .signInWithemailandpassword(email: email, password: password);
          }),
        ],
      ),
    );
  }
}

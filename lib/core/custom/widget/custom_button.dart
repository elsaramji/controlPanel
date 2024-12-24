// core/custom/widget/custom_button.dart

import 'package:flutter/material.dart';

import '../../Style/custom_buttons_style.dart';
import '../../styles/font_style.dart';


class CustomButton extends StatelessWidget {
  final String titel;
  final Color titelcolor;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.titel,
    required this.onPressed,
    this.style,
    required this.titelcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? CustomButtonsStyle.primeryButtonstyle,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: Center(
          child: Text(
            titel,
            style: TextsStyle.bold16.copyWith(color: titelcolor),
          ),
        ),
      ),
    );
  }
}

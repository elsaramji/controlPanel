// core/custom/buttons/custom_button.dart

import 'package:flutter/material.dart';

import '../../styles/font_style.dart';
import 'Style/custom_buttons_style.dart';

class CustomButton extends StatelessWidget {
  final String titel;
  final Color titelcolor;
  final void Function()? onPressed;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.titel,
    this.onPressed,
    this.style,
    required this.titelcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ?? CustomButtonsStyle.primeryButtonstyle,
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

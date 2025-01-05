// core/custom/buttons/custom_circle.dart

import 'package:flutter/material.dart';
import 'package:furits_control/core/custom/buttons/Style/custom_buttons_style.dart';

import '../../styles/color_style.dart';

class CustomCircleButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? iconcolor;
  final ButtonStyle? style;
  const CustomCircleButton(
      {super.key, this.onPressed, this.iconcolor, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ??
          CustomButtonsStyle.primeryButtonstyle.copyWith(
            shape: WidgetStateProperty.all(const CircleBorder()),
          ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.add,
            color: iconcolor ?? AppColors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}

// core/custom/inputsfileds/custom_text_filed.dart

import 'package:flutter/material.dart';
import 'package:furits_control/core/custom/inputsfileds/logic/function.dart';
import 'package:furits_control/core/custom/inputsfileds/style/borders.dart';

import '../../styles/color_style.dart';
import '../../styles/font_style.dart';

@immutable
// ignore: must_be_immutable
class CustomTextformField extends StatefulWidget {
  final String hinttext;

  final TextInputType keybordetepy;
  final void Function(String?)? onsaved;
  final int maxlines;
  final TextAlign textalign;
  bool obscuretext;
  final List<Icon>? suffixicons;
  CustomTextformField({
    super.key,
    required this.keybordetepy,
    required this.hinttext,
    this.textalign = TextAlign.start,
    this.maxlines = 1,
    this.onsaved,
    this.obscuretext = false,
    this.suffixicons,
  });

  @override
  State<CustomTextformField> createState() => _CustomTextformFieldState();
}

class _CustomTextformFieldState extends State<CustomTextformField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxlines,
      textAlign: widget.textalign,
      onSaved: widget.onsaved,
      style: TextsStyle.semibold13,
      keyboardType: widget.keybordetepy,
      obscureText: widget.obscuretext,
      validator: (value) {
        return LogicFunction.vaildator(value);
      },
      decoration: InputDecoration(
        hintText: widget.hinttext,
        suffixIcon: widget.suffixicons != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscuretext = !widget.obscuretext;
                  });
                },
                child: widget.obscuretext
                    ? widget.suffixicons![0]
                    : widget.suffixicons![1],
              )
            : null,
        hintStyle:
            TextsStyle.semibold13.copyWith(color: AppColors.grayscale400),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: TextfildeBorders.normallyborder(),
        enabledBorder: TextfildeBorders.normallyborder(),
        focusedBorder: TextfildeBorders.normallyborder(),
        errorBorder: TextfildeBorders.errorborder(),
        focusedErrorBorder: TextfildeBorders.errorborder(),
      ),
    );
  }
}

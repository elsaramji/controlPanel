// core/custom/inputsfileds/flexible_text_filed.dart
import 'package:flutter/material.dart';
import 'package:furits_control/core/custom/inputsfileds/custom_text_filed.dart';
import 'package:furits_control/generated/l10n.dart';

class FlexibleTextformField extends StatelessWidget {
  final TextInputType keybordetepy;
  final void Function(String?)? onsaved;
  final int maxlines;
  final TextAlign textalign;
  bool obscuretext;
  final List<Icon>? suffixicons;
  final String hinttext;
  String? initialValue;

  FlexibleTextformField(
      {super.key,
      required this.keybordetepy,
      required this.hinttext,
      this.onsaved,
      this.maxlines = 1,
      this.textalign = TextAlign.start,
      this.obscuretext = false,
      this.initialValue,
      this.suffixicons});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: CustomTextformField(
            onsaved: onsaved,
            maxlines: maxlines,
            initialValue: initialValue,
            textalign: textalign,
            obscuretext: obscuretext,
            suffixicons: suffixicons,
            keybordetepy: keybordetepy,
            hinttext: hinttext));
  }
}

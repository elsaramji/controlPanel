// components/controls/logic/function.dart
import 'package:flutter/material.dart';

class  ControlsFunction {
  
  static goingTo(BuildContext context, String routeName) {
    {
      Navigator.pushNamed(context, routeName);
    }
  }
}
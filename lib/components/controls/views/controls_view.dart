// components/controls/views/controls_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furits_control/components/controls/constant/controls_list.dart';

import '../../../core/custom/appbars/custom_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../widgets/go_click.dart';

class ControlsView extends StatelessWidget {
  static const routeName = '/controls';
  const ControlsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.customAppBar(
          context: context,
          title: "لوحة التحكم",
        ),
        body: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: Constants.items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GoClickItems(
                    index: index,
                  ));
            }));
  }
}


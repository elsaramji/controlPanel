// components/controls/views/controls_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furits_control/components/controls/constant/controls_list.dart';
import '../../../core/custom/widget/custom_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ControlsView extends StatelessWidget {
  static const route = '/controls';
  const ControlsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context: context,
          title: "لوحة التحكم",
        ),
        body: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: Constants.items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    hoverColor: AppColors.green50,
                    splashColor: AppColors.green50,
                    highlightColor: AppColors.green50,
                    onTap: () {
                      Constants.items[index]
                          .onTap(context, Constants.items[index].routeName);
                    },
                    child: Row(children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: AppColors.green50,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            Constants.items[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        Constants.items[index].title,
                        style: TextsStyle.bold16
                            .copyWith(color: AppColors.green1600),
                      ),
                    ]),
                  ));
            }));
  }
}

// components/controls/views/controls_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furits_control/components/controls/logic/controls_model.dart';
import 'package:furits_control/constants/assets.dart';

import '../../../core/custom/widget/custom_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ControlsView extends StatelessWidget {
  static const route = '/controls';
  static List<ControlsModel> items = [
    ControlsModel(title: "أدارة المنتجات", image: Assets.assetsImageBox),
    ControlsModel(
        title: "خدمة العملاء والطلبات", image: Assets.assetsImageChecked),
    ControlsModel(title: "أدارة الشحن والتوصيل", image: Assets.assetsImageVan),
  ];

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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    hoverColor: AppColors.green50,
                    splashColor: AppColors.green50,
                    highlightColor: AppColors.green50,
                    onTap: () {},
                    child: Row(children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: AppColors.green50,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            items[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        items[index].title,
                        style: TextsStyle.bold16
                            .copyWith(color: AppColors.green1600),
                      ),
                    ]),
                  ));
            }));
  }
}

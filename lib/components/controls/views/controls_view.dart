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
    ControlsModel(title: "خدمة العملاء والطلبات", image: Assets.assetsImageBox),
    ControlsModel(title: "ادارة المنتجات", image: Assets.assetsImageChecked),
    ControlsModel(title: "ادارة الشحن والتوصيل", image: Assets.assetsImageVan),
  ];

  const ControlsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            context: context,
            title: "لوحة التحكم",
            iconleading: const Icon(Icons.arrow_back_ios)),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
               
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                      child: SvgPicture.asset(
                        items[index].image,
                        width: 40,
                        height: 40,
                      ),
                    )),
                title: Text(
                  items[index].title,
                  style: TextsStyle.bold16.copyWith(color: AppColors.green1600),
                ),
              );
            }));
  }
}

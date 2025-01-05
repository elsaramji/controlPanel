// components/controls/widgets/go_click.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../constant/controls_list.dart';

class GoClickItems extends StatelessWidget {
  final int index;
  const GoClickItems({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.green50,
      splashColor: AppColors.green50,
      highlightColor: AppColors.green50,
      onTap: () {
        Constants.items[index].onTap(context, Constants.items[index].routeName);
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
          style: TextsStyle.bold16.copyWith(color: AppColors.green1600),
        ),
      ]),
    );
  }
}

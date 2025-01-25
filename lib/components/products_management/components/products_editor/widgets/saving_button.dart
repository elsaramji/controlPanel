// components/products_management/components/products_editor/widgets/saving_button.dart
import 'package:flutter/material.dart';

import '../../../../../core/custom/buttons/Style/custom_buttons_style.dart';
import '../../../../../core/custom/buttons/custom_button.dart';
import '../../../../../core/styles/color_style.dart';

class SavingButtons extends StatelessWidget {
  final Function()? onPressedSaver;
  final Function()? onpressedCancel;
  const SavingButtons({
    super.key,
    this.onpressedCancel,
    this.onPressedSaver,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          titel: "حفظ المنتج",
          onPressed: onPressedSaver,
          titelcolor: AppColors.white,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
          titel: "الغاء",
          onPressed: onpressedCancel,
          style: CustomButtonsStyle.primeryButtonstyle.copyWith(
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.grayscale200),
          ),
          titelcolor: AppColors.grayscale950,
        ),
      ],
    );
  }
}

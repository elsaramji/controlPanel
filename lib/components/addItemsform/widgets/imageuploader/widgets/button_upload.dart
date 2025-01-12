// components/addItemsform/widgets/imageuploader/widgets/button_upload.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/addItemsform/widgets/imageuploader/widgets/image_selector.dart';

import '../../../../../core/custom/buttons/custom_button.dart';
import '../../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../../core/styles/color_style.dart';
import '../../../../../service/blocks/cubits/upload/upload_image_cubit.dart';

class ButtonUpload extends StatelessWidget {
  const ButtonUpload({
    super.key,
    required this.widget,
  });

  final UploadSelctor widget;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('رفع صورة للمنتج'),
      const SizedBox(
        height: 8,
      ),
      CustomButton(
        titel: "رفع الصورة",
        onPressed: () {
          if (widget.file != null) {
            BlocProvider.of<UploadImageCubit>(context).uploadimage(
              supbase: widget.hup,
              file: widget.file!,
              productid: Random().nextInt(100).toString(),
            );
          } else {
            ErrorsMassage.errorsBar(context, 'يرجى اختيار صورة المنتج');
          }
        },
        titelcolor: AppColors.white,
      ),
    ]);
  }
}
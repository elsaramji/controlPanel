// components/products_management/components/add_product/widgets/imageuploader/widgets/button_upload.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../../core/custom/buttons/custom_button.dart';
import '../../../../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../../../../core/styles/color_style.dart';
import '../../../../../../../service/blocks/cubits/upload_image/upload_image_cubit.dart';
import '../view/upload_image.dart';

class ButtonUpload extends StatefulWidget {
  const ButtonUpload({
    super.key,
    required this.widget,
  });

  final UploadImage widget;

  @override
  State<ButtonUpload> createState() => _ButtonUploadState();
}

class _ButtonUploadState extends State<ButtonUpload> {
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
          if (widget.widget.file != null) {
            BlocProvider.of<UploadImageCubit>(context).uploadimage(
              supbase: widget.widget.hup,
              file: widget.widget.file!,
            );
            setState(() {
              widget.widget.isuploaded = true;
            });
          } else {
            ErrorsMassage.errorsBar(context, 'يرجى اختيار صورة المنتج');
          }
        },
        titelcolor: AppColors.white,
      ),
    ]);
  }
}

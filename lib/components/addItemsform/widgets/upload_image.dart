// components/addItemsform/widgets/upload_image.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furits_control/components/addItemsform/logic/function.dart';
import 'package:furits_control/constants/assets.dart';

import '../../../core/custom/buttons/custom_button.dart';
import '../../../core/styles/color_style.dart';

class UploadImage extends StatefulWidget {
  final Function()? onPressed;
  bool isloaded = false;
  late File file;
  UploadImage({
    super.key,
    this.onPressed,
  });

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () async {
          AddItemsFunction.uploadimage().then((value) {
            if (value != null) {
              setState(() {
                widget.isloaded = true;
                widget.file = File(value.path);
              });
            }
          });
        },
        child: widget.isloaded
            ? Stack(
                children: [
                  Image.file(
                    widget.file,
                    width: 112,
                    height: 112,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.isloaded = false;
                        });
                      },
                      child: const Icon(
                        Icons.cancel,
                        color: AppColors.green1400,
                      ),
                    ),
                  ),
                ],
              )
            : SvgPicture.asset(
                Assets.assetsImageGalleryExport,
              ),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('رفع صورة للمنتج'),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
          titel: "رفع الصورة",
          onPressed: widget.onPressed,
          titelcolor: AppColors.white,
        ),
      ]),
    ]);
  }
}

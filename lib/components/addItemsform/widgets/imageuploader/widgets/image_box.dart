// components/addItemsform/widgets/imageuploader/widgets/image_box.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/assets.dart';
import '../../../../../core/styles/color_style.dart';

class ImageBox extends StatefulWidget {
  bool isloaded = false;
  File? file;
  ImageBox({super.key, this.file, required this.isloaded});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  @override
  Widget build(BuildContext context) {
    return widget.file != null
        ? Stack(
            children: [
              Image.file(
                widget.file!,
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
                      widget.file = null;
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
          );
  }
}

// components/products_management/components/add_product/widgets/imageuploader/view/upload_image.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/core/custom/show_errors/custom_errors_massage.dart';
import 'package:furits_control/service/supbace/storage_supbase.dart';


import '../../../../../../../core/styles/color_style.dart';
import '../../../../../../../service/blocks/cubits/upload_image/upload_image_cubit.dart';
import '../../../logic/function.dart';
import '../widgets/button_upload.dart';
import '../widgets/image_box.dart';

class UploadImage extends StatefulWidget {
  bool isloaded = false;
  bool imageisloading = false;
  bool isuploaded = false;
  File? file;
  final StorageSupbase hup;

  UploadImage({
    super.key,
    required this.hup,
  });
  get isupload => isuploaded;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadImageCubit(),
      child: Builder(builder: (context) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            if (state is UploadImageSuccess) {
              widget.imageisloading = false;
              ErrorsMassage.errorsBar(context, 'تم رفع الصورة بنجاح');
            } else if (state is UploadImageError) {
              ErrorsMassage.errorsBar(context, state.message);
              widget.imageisloading = false;
            }
            if (state is UploadImageLoading) {
              widget.imageisloading = true;
            }
          },
          builder: (context, state) {
            return widget.imageisloading
                ? const Center(
                    child: SpinKitWave(
                      color: AppColors.green1400,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        GestureDetector(
                            onTap: () async {
                              PickImageFunction.pickimagelocal().then((value) {
                                if (value != null) {
                                  setState(() {
                                    widget.isloaded = true;
                                    widget.file = File(value.path);
                                  });
                                }
                              });
                            },
                            child: ImageBox(
                              isloaded: widget.isloaded,
                              file: widget.file,
                            )),
                        ButtonUpload(widget: widget),
                      ]);
          },
        );
      }),
    );
  }
}

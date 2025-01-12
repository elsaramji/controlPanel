// components/addItemsform/widgets/imageuploader/widgets/image_selector.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furits_control/components/addItemsform/widgets/imageuploader/widgets/image_box.dart';

import '../../../../../service/supbace/storage_supbase.dart';
import '../../../logic/function.dart';
import 'button_upload.dart';

class UploadSelctor extends StatefulWidget {
  bool isloaded = false;

  File? file;

  final StorageSupbase hup;
  UploadSelctor({super.key, this.file, required this.hup});

  @override
  State<UploadSelctor> createState() => _UploadSelctorState();
}

class _UploadSelctorState extends State<UploadSelctor> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
  }
}

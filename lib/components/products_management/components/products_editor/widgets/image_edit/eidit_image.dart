// components/products_management/components/products_editor/widgets/image_edit/eidit_image.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furits_control/service/supbace/storage_supbase.dart';

import '../../../add_product/widgets/imageuploader/view/upload_image.dart';

class EiditImage extends StatefulWidget {
  String? imageUrl;
  final StorageSupbase hup;
  EiditImage({super.key, required this.hup, this.imageUrl});

  @override
  State<EiditImage> createState() => _EiditImageState();
}

class _EiditImageState extends State<EiditImage> {
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl != null
        ? GestureDetector(
            onTap: () {
              setState(() {
                widget.imageUrl = null;
              });
            },
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl!,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          )
        : UploadImage(
            hup: widget.hup,
          );
  }
}

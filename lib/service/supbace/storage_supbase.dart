// service/supbace/storage_supbase.dart
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:furits_control/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageSupbase {
  String imageurl = "";
  // Add your Supabase storage methods here
  Future<Either<Failure, String>> uploadImage_supbase(
      {required File file}) async {
    // await Supabase.instance.client.storage.createBucket('products');
    StorageFileApi storage = Supabase.instance.client.storage.from('products');

    try {
      await storage.upload(
        "products/${file.path}",
        file,
      );
      imageurl = storage.getPublicUrl("products/${file.path}");
      return right(imageurl);
    } catch (e) {
      log(e.toString());
      return left(Failure(e.toString()));
    }
  }

  String? get imageUrlpp {
    if (imageurl.isNotEmpty) {
      return imageurl;
    } else {
      return null;
    }
  }
}

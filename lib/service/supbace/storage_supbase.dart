// service/supbace/storage_supbase.dart
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:furits_control/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageSupbase {
  // Add your Supabase storage methods here
  Future<Either<Failure, String>> uploadImage_supbase(
      {required File file, required String productid}) async {
    // await Supabase.instance.client.storage.createBucket('products');
    StorageFileApi storage = Supabase.instance.client.storage.from('products');

    try {
      await storage.upload(
        "products/$productid",
        file,
      );
      log(storage.getPublicUrl(file.path));
      return right(storage.getPublicUrl(file.path));
    } catch (e) {
      log(e.toString());
      return left(Failure(e.toString()));
    }
  }
}

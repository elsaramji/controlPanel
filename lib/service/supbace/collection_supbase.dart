// service/supbace/collection_supbase.dart

import 'package:dartz/dartz.dart';
import 'package:furits_control/core/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/errors/failure.dart';

class CollectionSupbase {
  static String products = 'products';
  SupabaseClient supabase = Supabase.instance.client;
  CollectionSupbase();
  Future<Either<Failure, bool>> addProduct({required Product product}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await supabase.from(products).insert([productmap]);
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

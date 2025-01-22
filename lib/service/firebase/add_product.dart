// service/firebase/add_product.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:furits_control/core/errors/failure.dart';
import 'package:furits_control/core/models/product.dart';

class FirebaseCollaction {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  String? productCode;

  Future<Either<Failure, bool>> addProduct({required Product product}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await products.doc(product.id).set(productmap);

      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> updateProduct(
      {required Product product, required String id}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await products.doc(id).update(productmap);
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteProduct({required String id}) async {
    try {
      await products.doc(id).delete();
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

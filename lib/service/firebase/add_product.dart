// service/firebase/add_product.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:furits_control/core/errors/failure.dart';
import 'package:furits_control/core/models/product.dart';

class FirebaseCollaction {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<Either<Failure, bool>> addProduct({required Product product}) async {
    try {
      Map<String, dynamic> productmap = product.toMap();
      await products.add(productmap);
      getProductId();
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  getProductId()async{
    return await products.doc().id;
  }
}
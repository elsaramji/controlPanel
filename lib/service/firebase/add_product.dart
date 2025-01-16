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
      return right(true);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<DocumentSnapshot>>> getProducts() async {
    QuerySnapshot snapshot = await products.get();
    if (snapshot.docs.isNotEmpty) {
      try {
        return right(snapshot.docs);
      } on FirebaseException catch (e) {
        if (e.code == 'permission-denied') {
          return left(Failure('Permission Denied'));
        } else if (e.code == 'network-request-failed') {
          return left(Failure('لا يوجد اتصال بالشبكة'));
        } else if (e.code == 'unavailable') {
          return left(Failure('لا يوجد اتصال بالشبكة'));
        }
        return left(Failure(e.message!));
      } catch (e) {
        return left(Failure(e.toString()));
      }
    } else {
      return left(Failure('لا يوجد منتجات'));
    }
  }
}

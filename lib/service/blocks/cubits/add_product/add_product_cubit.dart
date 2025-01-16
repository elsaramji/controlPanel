// service/blocks/cubits/add_product/add_product_cubit.dart
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:furits_control/service/firebase/add_product.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/product.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  void addproduct(
      {required FirebaseCollaction collaction,
      required Product product}) async {
    emit(AddProductLoading());
    final result = await collaction.addProduct(product: product);
    result.fold((l) {
      log(l.message);
      emit(AddProductError(errorMessage: l.message));
    }, (r) {
      emit(AddProductSuccess(addDone: r));
    });
  }
}

// service/blocks/cubits/update_products/update_products_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:furits_control/core/models/product.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';
import 'package:meta/meta.dart';

part 'update_products_state.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  final FirebaseDataService collaction;
  final Product product;
  UpdateProductsCubit({required this.collaction, required this.product})
      : super(UpdateProductsInitial());

  void updateProduct() async {
    emit(UpdateProductsLoading());
    await collaction
        .updateProduct(product: product, id: product.id)
        .then((value) {
      value.fold((l) {
        emit(UpdateProductsError(message: l.toString()));
      }, (r) {
        emit(UpdateProductsSuccess());
      });
    });
  }
}

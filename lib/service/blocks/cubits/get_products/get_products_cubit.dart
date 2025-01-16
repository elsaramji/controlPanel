// service/blocks/cubits/get_products/get_products_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/product.dart';
import '../../../firebase/add_product.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final products = await FirebaseCollaction().getProducts();
    products.fold((l) {
      emit(GetProductsError(errorMessage: l.message));
    }, (r) {
      List<Product> productslist = [];
      for (var element in r) {
        Product.fromJson(element.data() as Map<String, dynamic>);
        productslist
            .add(Product.fromJson(element.data() as Map<String, dynamic>));
      }
      emit(GetProductsSuccess(products: productslist));
    });
  }
}

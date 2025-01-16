// service/blocks/cubits/get_products/get_products_state.dart
part of 'get_products_cubit.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsSuccess extends GetProductsState {
  final List<Product> products;
  GetProductsSuccess({required this.products});
}

class GetProductsError extends GetProductsState {
  final String errorMessage;
  GetProductsError({required this.errorMessage});
}

class GetProductsLoading extends GetProductsState {}

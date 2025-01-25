// service/blocks/cubits/update_products/update_products_state.dart
part of 'update_products_cubit.dart';

@immutable
abstract class UpdateProductsState {}

class UpdateProductsInitial extends UpdateProductsState {}

class UpdateProductsLoading extends UpdateProductsState {}

class UpdateProductsSuccess extends UpdateProductsState {}

class UpdateProductsError extends UpdateProductsState {
  final String message;
  UpdateProductsError({required this.message});
}


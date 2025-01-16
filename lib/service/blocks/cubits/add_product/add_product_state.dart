// service/blocks/cubits/add_product/add_product_state.dart
part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final bool addDone;
  AddProductSuccess({required this.addDone});
}

class AddProductError extends AddProductState {
  final String errorMessage;
  AddProductError({required this.errorMessage});
}

class AddProductLoading extends AddProductState {}

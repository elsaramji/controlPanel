// components/products_management/components/products_editor/logic/function.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/products_management/components/products_editor/view/products_editor.dart';
import '../../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../../service/blocks/cubits/update_products/update_products_cubit.dart';

class UpdataProductSever {
  static void updateProductService(
      BuildContext context, ProductsEditor widget) {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      BlocProvider.of<UpdateProductsCubit>(context).updateProduct();
    } else {
      ErrorsMassage.errorsBar(context, "من فضلك ادخل جميع البيانات");
    }
  }
}

// components/products_management/components/add_product/logic/function.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../../core/models/product.dart';
import '../../../../../service/blocks/cubits/add_product/add_product_cubit.dart';
import '../../../../../service/firebase/firebaseDataService.dart';
import '../../../../../service/supbace/storage_supbase.dart';
import '../view/add_product_form.dart';



// this class is responsible for picking an image from the gallery
class PickImageFunction {
  static Future<XFile?> pickimagelocal() async {
    Future<XFile?> picker =
        ImagePicker().pickImage(source: ImageSource.gallery);
    return picker;
  }
}
// this class is responsible for saving the product data to the database
class UploadProduct {
  static void addProductService(BuildContext context,
      {required FirebaseDataService collaction,
      required StorageSupbase hup,
      required String name,
      required String dateofproduction,
      required String dateofexpire,
      required String quantity,
      required String price,
      required String description}) {
    BlocProvider.of<AddProductCubit>(context).addproduct(
        collaction: collaction,
        product: Product(
            id: GenerateProductCode.generateProductCode(),
            name: name,
            dateofproduction: dateofproduction,
            dateofexpire: dateofexpire,
            quantity: quantity,
            price: price,
            description: description,
            imageurl: hup.imageurl));
  }
}
// this class is responsible for generating a product code
class GenerateProductCode {
  static String generateProductCode() {
    // Get the current date
    final DateTime now = DateTime.now();
    final String datePart =
        "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";

    // Generate a random 4-digit number
    final Random random = Random();
    final String uniquePart = random.nextInt(10000).toString().padLeft(4, '0');

    // Combine parts to create the product code
    return "$datePart-$uniquePart";
  }
}
// this class is responsible for saving the product data to the database
class SaveProductForm {
  static void saveProductData(BuildContext context, AddProductForm widget) {
    if (widget.formKey.currentState!.validate() &&
        widget.hup.imageUrlpp != null) {
      widget.formKey.currentState!.save();
      UploadProduct.addProductService(context,
          collaction: widget.collaction,
          hup: widget.hup,
          name: widget.name,
          dateofproduction: widget.dateofproduction,
          dateofexpire: widget.dateofexpire,
          quantity: widget.quantity,
          price: widget.price,
          description: widget.description);
    } else {
      ErrorsMassage.errorsBar(context, "من فضلك ادخل جميع البيانات");
    }
  }
}

// components/products_management/components/products_editor/widgets/product_form_filed.dart
import 'package:flutter/material.dart';
import 'package:furits_control/components/products_management/components/products_editor/view/products_editor.dart';
import 'package:furits_control/core/models/product.dart';

import '../../../../../core/custom/inputsfileds/flexible_text_filed.dart';

class ProductForm extends StatelessWidget {
  final GlobalKey<FormState> formkey; //formkey;
  final Function(String?)? name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description;
  final Product product;

  const ProductForm({
    super.key,
    required this.formkey,
    required this.name,
    required this.dateofproduction,
    required this.dateofexpire,
    required this.quantity,
    required this.price,
    required this.description,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FlexibleTextformField(
              onsaved: name,
              initialValue: product.name,
              keybordetepy: TextInputType.text,
              hinttext: "اسم المنتج"),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlexibleTextformField(
                  onsaved: dateofproduction,
                  initialValue: product.dateofproduction,
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتاج"),
              const SizedBox(
                width: 8,
              ),
              FlexibleTextformField(
                  onsaved: dateofexpire,
                  initialValue: product.dateofexpire,
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتهاء"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FlexibleTextformField(
                onsaved: quantity,
                initialValue: product.quantity,
                keybordetepy: TextInputType.number,
                hinttext: "الكمية"),
            const SizedBox(
              width: 8,
            ),
            FlexibleTextformField(
                onsaved: price,
                initialValue: product.price,
                keybordetepy: TextInputType.number,
                hinttext: "السعر"),
          ]),
          const SizedBox(
            height: 8,
          ),
          FlexibleTextformField(
              onsaved: description,
              initialValue: product.description,
              keybordetepy: TextInputType.text,
              maxlines: 5,
              textalign: TextAlign.start,
              hinttext: "وصف المنتج"),
        ]));
  }
}

class ProductEditingViwe extends StatelessWidget {
  const ProductEditingViwe({
    super.key,
    required this.widget,
  });

  final ProductsEditor widget;

  @override
  Widget build(BuildContext context) {
    return ProductForm(
      formkey: widget.formKey,
      product: widget.product,
      name: (value) {
        widget.product.name = value!;
        //log(name);
      },
      dateofproduction: (value) {
        widget.product.dateofproduction = value!;
      },
      dateofexpire: (value) {
        widget.product.dateofexpire = value!;
      },
      quantity: (value) {
        widget.product.quantity = value!;
      },
      price: (value) {
        widget.product.price = value!;
      },
      description: (value) {
        widget.product.description = value!;
      },
    );
  }
}

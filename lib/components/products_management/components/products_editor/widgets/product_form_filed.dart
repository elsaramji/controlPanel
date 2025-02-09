// components/products_management/components/products_editor/widgets/product_form_filed.dart
import 'package:flutter/material.dart';
import 'package:furits_control/components/products_management/components/products_editor/view/products_editor.dart';
import 'package:furits_control/core/models/product.dart';

import '../../../../../core/custom/inputsfileds/flexible_text_filed.dart';

class ProductForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final Product product;
  //formkey;
  final Function(String?)? name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      calories;
  bool isOrganic = false;

  ProductForm({
    super.key,
    required this.formkey,
    required this.name,
    required this.dateofproduction,
    required this.dateofexpire,
    required this.quantity,
    required this.price,
    required this.description,
    required this.calories,
    required this.isOrganic,
    required this.product,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FlexibleTextformField(
              onsaved: widget.name,
              initialValue: widget.product.name,
              keybordetepy: TextInputType.text,
              hinttext: "اسم المنتج"),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlexibleTextformField(
                  onsaved: widget.dateofproduction,
                  initialValue: widget.product.dateofproduction,
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتاج"),
              const SizedBox(
                width: 8,
              ),
              FlexibleTextformField(
                  onsaved: widget.dateofexpire,
                  initialValue: widget.product.dateofexpire,
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتهاء"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FlexibleTextformField(
                onsaved: widget.quantity,
                initialValue: widget.product.quantity,
                keybordetepy: TextInputType.number,
                hinttext: "الكمية"),
            const SizedBox(
              width: 8,
            ),
            FlexibleTextformField(
                onsaved: widget.price,
                initialValue: widget.product.price,
                keybordetepy: TextInputType.number,
                hinttext: "السعر"),
          ]),
          const SizedBox(
            height: 8,
          ),
          FlexibleTextformField(
              onsaved: widget.description,
              initialValue: widget.product.description,
              keybordetepy: TextInputType.text,
              maxlines: 5,
              textalign: TextAlign.start,
              hinttext: "وصف المنتج"),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text("منتج طبيعى؟"),
              Checkbox(
                  value: widget.product.isOrganic,
                  onChanged: (value) {
                    setState(() {
                      widget.isOrganic = value!;
                      widget.product.isOrganic = widget.isOrganic;
                    });
                  }),
              Spacer(),
              FlexibleTextformField(
                  initialValue: widget.product.calories,
                  onsaved: widget.calories,
                  keybordetepy: TextInputType.number,
                  hinttext: "كالوريس المنتج"),
            ],
          ),
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
      calories: (value) {
        widget.product.calories = value!;
      },
      isOrganic: widget.product.isOrganic,
    );
  }
}

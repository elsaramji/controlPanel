// components/products_management/components/add_product/widgets/product_form_filed.dart
import 'package:flutter/material.dart';

import '../../../../../core/custom/inputsfileds/flexible_text_filed.dart';
import '../view/add_product_form.dart';

class ProductForm extends StatefulWidget {
  final GlobalKey<FormState> formkey; //formkey;
  final Function(String?)? name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      calories;

  ProductForm(
      {super.key,
      required this.formkey,
      required this.name,
      required this.dateofproduction,
      required this.dateofexpire,
      required this.quantity,
      required this.price,
      required this.description,
      required this.calories,
      required this.isOrganic});

  @override
  State<ProductForm> createState() => _ProductFormState();
  bool isOrganic = false;
}

class _ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FlexibleTextformField(
              onsaved: widget.name,
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
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتاج"),
              const SizedBox(
                width: 8,
              ),
              FlexibleTextformField(
                  onsaved: widget.dateofexpire,
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
                keybordetepy: TextInputType.number,
                hinttext: "الكمية"),
            const SizedBox(
              width: 8,
            ),
            FlexibleTextformField(
                onsaved: widget.price,
                keybordetepy: TextInputType.number,
                hinttext: "السعر"),
          ]),
          const SizedBox(
            height: 8,
          ),
          FlexibleTextformField(
              onsaved: widget.description,
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
                  value: widget.isOrganic,
                  onChanged: (value) {
                    setState(() {
                      widget.isOrganic = value!;
                    });
                  }),
              Spacer(),
              FlexibleTextformField(
                  onsaved: widget.calories,
                  keybordetepy: TextInputType.number,
                  hinttext: "كالوريس المنتج"),
            ],
          ),
        ]));
  }
}

class ProductFormViwe extends StatelessWidget {
  const ProductFormViwe({
    super.key,
    required this.widget,
  });

  final AddProductForm widget;

  @override
  Widget build(BuildContext context) {
    return ProductForm(
      formkey: widget.formKey,
      name: (value) {
        widget.name = value!;
        //log(name);
      },
      dateofproduction: (value) {
        widget.dateofproduction = value!;
      },
      dateofexpire: (value) {
        widget.dateofexpire = value!;
      },
      quantity: (value) {
        widget.quantity = value!;
      },
      price: (value) {
        widget.price = value!;
      },
      description: (value) {
        widget.description = value!;
      },
      calories: (value) {
        widget.calories = value!;
      },
      isOrganic: widget.isOrganic,
    );
  }
}

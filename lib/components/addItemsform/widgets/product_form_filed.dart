// components/addItemsform/widgets/product_form_filed.dart
import 'package:flutter/material.dart';

import '../../../core/custom/inputsfileds/flexible_text_filed.dart';

class ProductForm extends StatelessWidget {
  final GlobalKey<FormState> formkey; //formkey;
  final Function(String?)? name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description;
 ProductForm({super.key, required this.formkey,
  required this.name,
  required this.dateofproduction,
  required this.dateofexpire,
  required this.quantity,
  required this.price,
  required this.description});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FlexibleTextformField(
              onsaved: name,
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
                  keybordetepy: TextInputType.datetime,
                  hinttext: "تاريخ الانتاج"),
              const SizedBox(
                width: 8,
              ),
              FlexibleTextformField(
                  onsaved: dateofexpire,
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
                keybordetepy: TextInputType.number,
                hinttext: "الكمية"),
            const SizedBox(
              width: 8,
            ),
            FlexibleTextformField(
                onsaved: price,
                keybordetepy: TextInputType.number,
                hinttext: "السعر"),
          ]),
          const SizedBox(
            height: 8,
          ),
          FlexibleTextformField(
              onsaved: description,
              keybordetepy: TextInputType.text,
              maxlines: 5,
              textalign: TextAlign.start,
              hinttext: "وصف المنتج"),
        ]));
  }
}

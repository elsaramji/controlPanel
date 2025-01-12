// components/addItemsform/view/adding_form.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:furits_control/components/addItemsform/widgets/saving_button.dart';
import 'package:furits_control/core/injection/get_it.dart';

import '../../../core/custom/appbars/custom_Appbar.dart';
import '../../../service/supbace/storage_supbase.dart';
import '../widgets/product_form_filed.dart';
import '../widgets/imageuploader/view/upload_image.dart';

class AddingForm extends StatelessWidget {
  static const routeName = '/AddingForm';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String? name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      imageurl;

  AddingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.customAppBar(
          context: context,
          title: "اضافة منتج",
          iconleading: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ProductForm(
                      formkey: formKey,
                      name: (value) {
                        name = value;
                        log(name!);
                      },
                      dateofproduction: (value) {
                        dateofproduction = value;
                      },
                      dateofexpire: (value) {
                        dateofexpire = value;
                      },
                      quantity: (value) {
                        quantity = value;
                      },
                      price: (value) {
                        price = value;
                      },
                      description: (value) {
                        description = value;
                      },
                    ),
                    const SizedOverflowBox(
                      size: Size.fromHeight(36),
                    ),
                    UploadImage(
                      hup: getIt<StorageSupbase>(),
                    ),
                    const SizedOverflowBox(
                      size: Size.fromHeight(108),
                    ),
                    SavingButtons(
                      onpressedCancel: () {},
                      onPressedSaver: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                    ),
                  ],
                ))));
  }
}

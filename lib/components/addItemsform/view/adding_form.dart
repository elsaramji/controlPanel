// components/addItemsform/view/adding_form.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/components/addItemsform/widgets/saving_button.dart';
import 'package:furits_control/components/products_management/views/products_view.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/blocks/cubits/add_product/add_product_cubit.dart';
import 'package:furits_control/service/firebase/add_product.dart';

import '../../../core/custom/appbars/custom_Appbar.dart';
import '../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../core/models/product.dart';
import '../../../core/styles/color_style.dart';
import '../../../service/supbace/storage_supbase.dart';
import '../widgets/imageuploader/view/upload_image.dart';
import '../widgets/product_form_filed.dart';

class AddingForm extends StatefulWidget {
  static const routeName = '/AddingForm';
  bool isloading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description;

  StorageSupbase hup = getIt<StorageSupbase>();
  FirebaseCollaction collaction = getIt<FirebaseCollaction>();
  AddingForm({super.key});

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: Builder(builder: (context) {
        return BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state is AddProductSuccess) {
              setState(() {
                widget.isloading = false;
              });

              Navigator.popAndPushNamed(context, ProductsView.routeName);
            } else if (state is AddProductError) {
              ErrorsMassage.errorsBar(context, state.errorMessage);
            }
            if (state is AddProductLoading) {
              widget.isloading = true;
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: CustomAppBar.customAppBar(
                  context: context,
                  title: "اضافة منتج",
                  iconleading: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                body: widget.isloading
                    ? const Center(
                        child: SpinKitFadingCircle(
                        color: AppColors.green1600,
                      ))
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ProductForm(
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
                                ),
                                const SizedOverflowBox(
                                  size: Size.fromHeight(36),
                                ),
                                UploadImage(
                                  hup: widget.hup,
                                ),
                                const SizedOverflowBox(
                                  size: Size.fromHeight(108),
                                ),
                                SavingButtons(
                                  onpressedCancel: () {},
                                  onPressedSaver: () {
                                    if (widget.formKey.currentState!
                                            .validate() &&
                                        widget.hup.imageUrlpp != null) {
                                      widget.formKey.currentState!.save();
                                      BlocProvider.of<AddProductCubit>(context)
                                          .addproduct(
                                              collaction: widget.collaction,
                                              product: Product(
                                                  id: generateProductCode(),
                                                  name: widget.name,
                                                  dateofproduction:
                                                      widget.dateofproduction,
                                                  dateofexpire:
                                                      widget.dateofexpire,
                                                  quantity: widget.quantity,
                                                  price: widget.price,
                                                  description:
                                                      widget.description,
                                                  imageurl:
                                                      widget.hup.imageurl));
                                    } else {
                                      ErrorsMassage.errorsBar(context,
                                          "من فضلك ادخل جميع البيانات");
                                    }
                                  },
                                ),
                              ],
                            ))));
          },
        );
      }),
    );
  }
}

String generateProductCode() {
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

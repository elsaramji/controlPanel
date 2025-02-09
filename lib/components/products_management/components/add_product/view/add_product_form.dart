// components/products_management/components/add_product/view/add_product_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/components/products_management/components/add_product/logic/function.dart';
import 'package:furits_control/components/products_management/views/products_view.dart';
import 'package:furits_control/core/custom/show_errors/custom_errors_massage.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/blocks/cubits/add_product/add_product_cubit.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';

import '../../../../../core/custom/appbars/custom_Appbar.dart';
import '../../../../../core/styles/color_style.dart';
import '../../../../../service/supbace/storage_supbase.dart';
import '../../products_editor/widgets/saving_button.dart';
import '../widgets/imageuploader/view/upload_image.dart';
import '../widgets/product_form_filed.dart';

class AddProductForm extends StatefulWidget {
  static const routeName = '/AddingForm';
  bool isloading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      calories;
  late bool isOrganic = false;

  StorageSupbase hup = getIt<StorageSupbase>();
  FirebaseDataService collaction = getIt<FirebaseDataService>();
  AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
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
                                //form sheet product
                                ProductFormViwe(widget: widget),
                                //spacer
                                const SizedOverflowBox(
                                  size: Size.fromHeight(36),
                                ),

                                //form sheet image
                                UploadImage(
                                  hup: widget.hup,
                                ),
                                //spacer
                                const SizedOverflowBox(
                                  size: Size.fromHeight(108),
                                ),
                                //form sheet button
                                SavingButtons(
                                  onpressedCancel: () {
                                    // cancel button
                                    widget.formKey.currentState!.reset();
                                    Navigator.pop(context);
                                  },
                                  onPressedSaver: () {
                                    // save button
                                    SaveProductForm.saveProductData(
                                        context, widget);
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

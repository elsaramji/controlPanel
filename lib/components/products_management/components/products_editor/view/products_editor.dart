// components/products_management/components/products_editor/view/products_editor.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/components/products_management/components/products_editor/logic/function.dart';
import 'package:furits_control/components/products_management/views/products_view.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/blocks/cubits/update_products/update_products_cubit.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';

import '../../../../../core/custom/appbars/custom_Appbar.dart';
import '../../../../../core/custom/inputsfileds/flexible_text_filed.dart'
    show FlexibleTextformField;
import '../../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../../core/models/product.dart';
import '../../../../../core/styles/color_style.dart';
import '../../../../../service/supbace/storage_supbase.dart';
import '../widgets/image_edit/eidit_image.dart';
import '../widgets/product_form_filed.dart';
import '../widgets/saving_button.dart';

class ProductsEditor extends StatefulWidget {
  static const routeName = '/editor';
  bool isloading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Product product;
  StorageSupbase hup = getIt<StorageSupbase>();
  FirebaseDataService collaction = getIt<FirebaseDataService>();

  ProductsEditor({
    super.key,
    required this.product,
  });

  @override
  State<ProductsEditor> createState() => _ProductsEditorState();
}

class _ProductsEditorState extends State<ProductsEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProductsCubit(
          collaction: widget.collaction, product: widget.product),
      child: Builder(builder: (context) {
        return BlocConsumer<UpdateProductsCubit, UpdateProductsState>(
          listener: (context, state) {
            if (state is UpdateProductsSuccess) {
              setState(() {
                widget.isloading = false;
              });

              Navigator.popAndPushNamed(context, ProductsView.routeName);
            } else if (state is UpdateProductsError) {
              ErrorsMassage.errorsBar(context, state.message);
            }
            if (state is UpdateProductsLoading) {
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
                                //form sheet edit product
                                ProductEditingViwe(widget: widget),
                                //spacer
                                const SizedOverflowBox(
                                  size: Size.fromHeight(36),
                                ),
                              
                                //form sheet edit image
                                EiditImage(
                                    hup: widget.hup,
                                    imageUrl: widget.product.imageurl),
                                //spacer
                                const SizedOverflowBox(
                                  size: Size.fromHeight(108),
                                ),
                                //form sheet edit button
                                SavingButtons(
                                  onpressedCancel: () {
                                    // cancel button
                                    widget.formKey.currentState!.reset();
                                    Navigator.pop(context);
                                  },
                                  onPressedSaver: () {
                                    // save button
                                    UpdataProductSever.updateProductService(
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

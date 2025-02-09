// components/products_management/views/products_view.dart
// components/products_management/views/products_view.dart

import 'package:flutter/material.dart';
import 'package:furits_control/components/products_management/logic/product_stream_biluder.dart';
import 'package:furits_control/core/custom/buttons/custom_circle.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';
import '../../../core/custom/appbars/custom_Appbar.dart';
import '../components/add_product/view/add_product_form.dart';

class ProductsView extends StatefulWidget {
  static const routeName = '/products';

  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  FirebaseDataService products = getIt<FirebaseDataService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomCircleButton(onPressed: () {
          Navigator.pushNamed(context, AddProductForm.routeName);
        }),
        appBar: CustomAppBar.customAppBar(
            context: context, title: 'ادارة المنتجات'),
        body: StreamBuilder(
            stream: products.getProduct(),
            builder: (context, snapshot) {
              return ProductsSreamViwe.productsSreamViwe(snapshot, context);
            }));
  }
}

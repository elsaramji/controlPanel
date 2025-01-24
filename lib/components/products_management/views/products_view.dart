// components/products_management/views/products_view.dart
// components/products_management/views/products_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/components/products_management/widget/product_card.dart';
import 'package:furits_control/core/custom/buttons/custom_circle.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/core/models/product.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';

import '../../../core/custom/appbars/custom_Appbar.dart';
import '../../addItemsform/view/add_product_form.dart';

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
              if (snapshot.hasData) {
                {
                  if (snapshot.data!.docs.isNotEmpty) {
                    return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          childAspectRatio: 163 / 214,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: Product.fromJson(
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>));
                        });
                  } else if (snapshot.data!.docs.isEmpty) {
                    return AlertDialog(
                      title: const Icon(
                        Icons.warning_outlined,
                        color: Colors.red,
                      ),
                      content: const Text('خطأ في الاتصال بقاعدة البيانات'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('اغلاق'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                        child: SpinKitCircle(
                      color: Colors.green,
                    ));
                  }
                }
              } else {
                return const Center(
                    child: SpinKitCircle(
                  color: Colors.green,
                ));
              }
            }));
  }
}

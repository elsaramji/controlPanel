// components/products_management/views/products_view.dart
import 'package:flutter/material.dart';

import '../../../core/custom/buttons/custom_circle.dart';

class ProductsView extends StatelessWidget {
  static const routeName = '/products';
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomCircleButton(
          onPressed: () {},
        ),
        body: const Center(child: Text('Product Management')));
  }
}

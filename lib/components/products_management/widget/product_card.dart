// components/products_management/widget/product_card.dart
import 'package:flutter/material.dart';

import '../../../core/custom/buttons/Style/custom_buttons_style.dart';
import '../../../core/models/product.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 16,
      child: Container(
          padding: const EdgeInsets.all(8),
          color: AppColors.grayscale200.withOpacity(0.3),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 131 / 99,
                      child:
                          Image.network(product.imageurl, fit: BoxFit.contain)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      product.name,
                      style: TextsStyle.semibold19
                          .copyWith(color: AppColors.grayscale950),
                    ),
                    subtitle: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "${product.price} جنية",
                          style: TextsStyle.bold16
                              .copyWith(color: AppColors.orange500),
                        ),
                        TextSpan(
                          text: "كيلو",
                          style: TextsStyle.semibold16
                              .copyWith(color: AppColors.orange300),
                        ),
                      ]),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                      style: CustomButtonsStyle.primeryButtonstyle.copyWith(
                          shape: const WidgetStatePropertyAll(CircleBorder())),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                child: const Icon(Icons.favorite_border_outlined),
              ),
            ),
          ])),
    );
  }
}

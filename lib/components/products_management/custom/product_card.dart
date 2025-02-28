// components/products_management/widget/product_card.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/firebase/firebaseDataService.dart';

import '../../../core/custom/buttons/Style/custom_buttons_style.dart';
import '../../../core/models/product.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';
import '../components/products_editor/view/products_editor.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  static FirebaseDataService collaction = getIt.get<FirebaseDataService>();

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
          color: AppColors.grayscale50.withOpacity(0.3),
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        imageUrl: product.imageurl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                                  child: SpinKitFadingCube(
                                    color: AppColors.green1600,
                                  ),
                                )),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: ListTile(
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
                        onPressed: () {
                          Navigator.pushNamed(context, ProductsEditor.routeName,
                              arguments: product);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.white,
                        ),
                        style: CustomButtonsStyle.primeryButtonstyle.copyWith(
                            shape:
                                const WidgetStatePropertyAll(CircleBorder())),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.sell_rounded,
                    color: AppColors.grayscale950,
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: const Text('هل تريد حذف المنتج ؟'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('نعم'),
                                    onPressed: () {
                                      collaction.deleteProduct(id: product.id);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('لا'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ]));
                  },
                  child: const Icon(
                    Icons.delete_rounded,
                    color: AppColors.grayscale950,
                  ),
                )),
          ])),
    );
  }
}

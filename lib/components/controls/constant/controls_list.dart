// components/controls/constant/controls_list.dart
import 'package:furits_control/components/controls/logic/function.dart';

import '../../../constants/assets.dart';
import '../../delivery_management/views/delivery_view.dart';
import '../../products_management/views/products_view.dart';
import '../../support_service/views/service_view.dart';
import '../logic/controls_model.dart';

class Constants {
  static List<ControlsModel> items = [
    ControlsModel(
        title: "أدارة المنتجات",
        image: Assets.assetsImageBox,
        onTap: ControlsFunction.goingTo,
        routeName: ProductsView.routeName),
    ControlsModel(
      title: "خدمة العملاء والطلبات",
      image: Assets.assetsImageChecked,
      onTap: ControlsFunction.goingTo,
      routeName: ServiceView.routeName,
    ),
    ControlsModel(
        title: "أدارة الشحن والتوصيل",
        image: Assets.assetsImageVan,
        onTap: ControlsFunction.goingTo,
        routeName: DeliveryView.routeName),
  ];
}

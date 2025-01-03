// components/controls/logic/controls_model.dart

class ControlsModel {
  final String title;
  final String image;
  final String routeName;
  final Function onTap;
  ControlsModel(
      {required this.title,
      required this.image,
      required this.onTap,
      required this.routeName});
}

// core/models/product.dart
class Product {
  final String name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      imageurl;

  Product(
      {required this.name,
      required this.dateofproduction,
      required this.dateofexpire,
      required this.quantity,
      required this.price,
      required this.description,
      required this.imageurl});
get image => imageurl;
}

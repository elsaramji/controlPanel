// core/models/product.dart
class Product {
  String name,
      dateofproduction,
      dateofexpire,
      quantity,
      price,
      description,
      imageurl;

  final String id;
  String calories;
  bool isOrganic = false;

  Product({
    required this.name,
    required this.dateofproduction,
    required this.dateofexpire,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageurl,
    required this.id,
    this.isOrganic = false,
    this.calories = "",
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      dateofproduction: json['dateofproduction'],
      dateofexpire: json['dateofexpire'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      imageurl: json['imageurl'],
      id: json['id'],
      isOrganic: json['isOrganic'],
      calories: json['calories'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateofproduction': dateofproduction,
      'dateofexpire': dateofexpire,
      'quantity': quantity,
      'price': price,
      'description': description,
      'imageurl': imageurl,
      'id': id,
      'isOrganic': isOrganic,
      'calories': calories,
    };
  }
}

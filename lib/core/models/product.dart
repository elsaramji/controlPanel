// core/models/product.dart


class Product {
  final String name;
  final String image;
  final String? description;
  final double price;
  final String unit;
  final String? category;

  Product({
    required this.name,
    required this.image,
    this.description,
    required this.price,
    required this.unit,
    this.category,
  });
/*
   static final List<Product> productstast = [
      Product(
          name: 'بطيخ',
          image: Assets.assetsImagesWatermelon,
          price: 100,
          unit: "كيلو"),
      Product(
        name: "فراولة",
        image: Assets.assetsImagesStrurewripry,
        price: 100,
        unit: "كيلو",
      ),
      Product(
        name: "اناناس",
        image: Assets.assetsImagesPineapple,
        price: 100,
        unit: "كيلو",
      ),
      Product(
        name: "افوكادو",
        image: Assets.assetsImagesAvocado,
        price: 100,
        unit: "كيلو",
      ),
      Product(
        name: "موز",
        image: Assets.assetsImagesPinna,
        price: 100,
        unit: "كيلو",
      ),
      Product(
        name: "مانجو",
        image: Assets.assetsImagesMango,
        price: 100,
        unit: "كيلو",
      ),
    ];*/
}

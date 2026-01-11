class Product {
  final String name;
  final int price;
  final String category;
  final bool isPromo;

  Product({
    required this.name,
    required this.price,
    required this.category,
    this.isPromo = false,
  });
}

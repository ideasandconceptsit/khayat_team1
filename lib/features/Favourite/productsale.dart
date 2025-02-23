class Productsale {
  String image;
  String name;
  String brand;
  String starImage;
  double price;
  double? discount;

  Productsale({
    required this.image,
    required this.starImage,
    required this.brand,
    required this.name,
    required this.price,
    this.discount,
  });
}

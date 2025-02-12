class Product {
  final int id;
  final String image;
  final String brand;
  final String name;
  final double price;
  final double? originalPrice;
  final int rating;
  final int reviews;
  final int? discount;

  const Product({
    required this.id,
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.reviews,
    this.discount,
  });
}

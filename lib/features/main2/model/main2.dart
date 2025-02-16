class ItemModel {
  final String image;
  final String name;
  final String brand;
  final double oldPrice;
  final double newPrice;
  final int discount;
  final int rating;
  final int reviews;

  ItemModel({
    required this.image,
    required this.name,
    required this.brand,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
  });
}

List<ItemModel> demoItems = [
  ItemModel(
    image: "assets/images/shert.png",
    name: "Evening Dress",
    brand: "Dorothy Perkins",
    oldPrice: 15,
    newPrice: 12,
    discount: 20,
    rating: 5,
    reviews: 10,
  ),
  ItemModel(
    image:  "assets/images/shert.png",
    name: "Sport Dress",
    brand: "Sitly",
    oldPrice: 22,
    newPrice: 19,
    discount: 15,
    rating: 4,
    reviews: 10,
  ),ItemModel(
    image:  "assets/images/shert.png",
    name: "Sport Dress",
    brand: "Sitly",
    oldPrice: 22,
    newPrice: 19,
    discount: 15,
    rating: 4,
    reviews: 10,
  ),ItemModel(
    image:  "assets/images/shert.png",
    name: "Sport Dress",
    brand: "Sitly",
    oldPrice: 22,
    newPrice: 19,
    discount: 15,
    rating: 4,
    reviews: 10,
  ),
];

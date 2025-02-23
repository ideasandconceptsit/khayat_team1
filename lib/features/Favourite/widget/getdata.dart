class Getdata {
  final String image;
  final String starImage;
  final String brand;
  final String name;
  final String color;
  final String size;
  final double price;
  final double? discount;
  final bool sold  ;

  Getdata(
      {
    required this.image,
    required this.starImage,
    required this.brand,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    this.discount,
        required this.sold,
  });
}
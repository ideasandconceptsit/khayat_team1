class DelivryMethodModel
{
  final String id;
  final String imageUrl;
  final String daysText;
  final double price;

  DelivryMethodModel({required this.price,required this.id, required this.imageUrl, required this.daysText});



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'daysText': daysText,
      'price': price,
    };
  }

  factory DelivryMethodModel.fromJson(Map<String, dynamic> json) {
    return DelivryMethodModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      daysText: json['daysText'],
      price: json['price'],
    );
  }
}
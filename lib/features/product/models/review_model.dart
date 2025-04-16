class ReviewModel {
  final String id;
  final String review;
  final int ratings;
  final User user;
  final String product;
  final String productType;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReviewModel({
    required this.id,
    required this.review,
    required this.ratings,
    required this.user,
    required this.product,
    required this.productType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      review: json['review'],
      ratings: json['ratings'],
      user: User.fromJson(json['user']),
      product: json['product'],
      productType: json['productType'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'review': review,
      'ratings': ratings,
      'user': user.toJson(),
      'product': product,
      'productType': productType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

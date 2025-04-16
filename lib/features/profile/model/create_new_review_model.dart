class CreateNewReviewModel {
  final String review;
  final int rating;
  final String userId;
  final String productId;
  final String productType;

  CreateNewReviewModel({
    required this.review,
    required this.rating,
    required this.userId,
    required this.productId,
    required this.productType,
  });

  factory CreateNewReviewModel.fromJson(Map<String, dynamic> json) {
    return CreateNewReviewModel(
      review: json["review"],
      rating: json["ratings"],
      userId: json["user"],
      productId: json["product"],
      productType: json["productType"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "review": review,
      "ratings": rating,
      "user": userId,
      "product": productId,
      "productType": productType,
    };
  }
}

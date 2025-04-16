class AddReviewParamter {
  final String review;
  final int rating;
  final String productId;
  final String user;
  final String productType;

  AddReviewParamter({required this.review, required this.rating, required this.productId, required this.user, required this.productType});


  Map<String, dynamic> toJson() {
    return {
      'review': review,
      'ratings': rating,
      'product': productId,
      'user': user,
      'productType': productType,
    };
  }
}
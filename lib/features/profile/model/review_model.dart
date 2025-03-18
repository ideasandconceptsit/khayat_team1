class ReviewModel {
  final String id;
  final String review;
  final int ratings;
  final UserModel user;
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
      user: UserModel.fromJson(json['user']),
      product: json['product'],
      productType: json['productType'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class UserModel {
  final String id;
  final String name;

  UserModel({
    required this.id,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class ReviewsResponse {
  final int results;
  final PaginationModel pagination;
  final List<ReviewModel> data;

  ReviewsResponse({
    required this.results,
    required this.pagination,
    required this.data,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsResponse(
      results: json['results'],
      pagination: PaginationModel.fromJson(json['paginationResult']),
      data: (json['data'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }
}

class PaginationModel {
  final int currentPage;
  final int limit;
  final int numberOfPages;

  PaginationModel({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'],
      limit: json['limit'],
      numberOfPages: json['numberOfPages'],
    );
  }
}

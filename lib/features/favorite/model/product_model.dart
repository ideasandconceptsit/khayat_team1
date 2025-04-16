// class ProductModel {
//   final String? id;
//   final String? name;
//   final String? unit;
//   final String? location;
//   final int? quantity;
//   final double? pricePerMeter;
//   final int? discount;
//   final int? minStock;
//   final int? maxStock;
//   final bool? active;
//   final double? ratingsAverage;
//   final int? ratingsQuantity;
//   final String? slug;
//   final bool? isLowStock;
//   final bool? isOverStocked;
//   final double? totalValue;
//   final String? categoryName;

//   ProductModel({
//     this.id,
//     this.name,
//     this.unit,
//     this.location,
//     this.quantity,
//     this.pricePerMeter,
//     this.discount,
//     this.minStock,
//     this.maxStock,
//     this.active,
//     this.ratingsAverage,
//     this.ratingsQuantity,
//     this.slug,
//     this.isLowStock,
//     this.isOverStocked,
//     this.totalValue,
//     this.categoryName,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'] ?? json['_id'],
//       name: json['name'],
//       unit: json['unit'],
//       location: json['location'],
//       quantity: json['quantity'],
//       pricePerMeter: (json['pricePerMeter'] as num?)?.toDouble(),
//       discount: json['discount'],
//       minStock: json['minStock'],
//       maxStock: json['maxStock'],
//       active: json['active'],
//       ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
//       ratingsQuantity: json['ratingsQuantity'],
//       slug: json['slug'],
//       isLowStock: json['isLowStock'],
//       isOverStocked: json['isOverStocked'],
//       totalValue: (json['totalValue'] as num?)?.toDouble(),
//       categoryName: json['category']?['name'],
//     );
//   }
// }

class PromoCodeModel {
  final String id;
  final String title;
  final String code;
  final String imageUrl;
  final int validityDays;

  PromoCodeModel(
      {required this.id,
      required this.title,
      required this.code,
      required this.imageUrl,
      required this.validityDays});

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      id: json['id'],
      title: json['title'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      validityDays: json['validityDays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'imageUrl': imageUrl,
      'validityDays': validityDays,
    };
  }

  PromoCodeModel copyWith({
    String? id,
    String? title,
    String? code,
    String? imageUrl,
    int? validityDays,
  }) {
    return PromoCodeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
      imageUrl: imageUrl ?? this.imageUrl,
      validityDays: validityDays ?? this.validityDays,
    );
  }
}

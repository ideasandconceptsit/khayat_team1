class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? role;
  final bool? active;
  final List<dynamic>? favoriteAccessories;
  final List<dynamic>? favoriteFabrics;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.active,
    this.favoriteAccessories,
    this.favoriteFabrics,
    this.createdAt,
    this.updatedAt,
    this.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UserModel(
      id: data['_id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      active: data['active'],
      favoriteAccessories: data['favoriteAccessories'],
      favoriteFabrics: data['favoriteFabrics'],
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      updatedAt: data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
      token: json['token'],
    );
  }
}

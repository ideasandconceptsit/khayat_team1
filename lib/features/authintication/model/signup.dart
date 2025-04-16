class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });
  // لتحويل الكائن إلى JSON عند الإرسال
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
    };
  }
  // إذا حبيت تستقبل بيانات من JSON (مش ضروري لتسجيل المستخدم لكن ممكن مفيد)
  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordConfirm: json['passwordConfirm'],
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/service/end_point.dart';

class ChangePasswordRepository {
  ChangePasswordRepository();

  Future<String?> changePassword({
    required String newPassword,
    required String currentPassword,
  }) async {
    try {
      print("🔵 [Repository] بدء طلب تغيير كلمة المرور...");

      final response = await http.put(
          Uri.parse(
              "${EndPoint.baseUrl}${EndPoint.changePassword}"),
          body: jsonEncode({
            "currentPassword": currentPassword,
            "newPassword": newPassword,
          }),
          headers: {
            "Content-Type": "application/json",
       'Authorization':"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2MzYjZlNWUyZTI3ODc3Y2QxMGQ0MmIiLCJpYXQiOjE3NDI3OTQwMjYsImV4cCI6MTc1MDU3MDAyNn0.-NVTsrS9s0wMBJ67T3HYXtPAjsWzTPU51-BALTaeR0M",

          });

      print("🟢 [Repository] استجابة السيرفر: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("✅ [Repository] تم تغيير كلمة المرور بنجاح");
        print("📌 currentPassword: $currentPassword");
        print("📌 newPassword: $newPassword");
        return null;
      } else {
        print("❌ [Repository] فشل تغيير كلمة المرور: ${response.body}");
        return "حدث خطأ أثناء تغيير كلمة المرور، حاول مرة أخرى.";
      }
    } catch (e) {
      print("❗ [Repository] خطأ استثنائي: $e");
      return "حدث خطأ غير متوقع، حاول لاحقًا.";
    }
  }
}

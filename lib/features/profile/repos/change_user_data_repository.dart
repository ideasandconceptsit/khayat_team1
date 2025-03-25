import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/service/end_point.dart';

class ChangeUserDtaRepository {
  ChangeUserDtaRepository();

  Future<String?> changeUserData({
    required String newEmail,
    required String newUsername,
    required String userId,
  }) async {
    try {
      print("🔵 [Repository] بدء طلب تغيير البيانات...");

      final response = await http.put(
        Uri.parse("${EndPoint.baseUrl}${EndPoint.changeUserData}$userId"),
        body: jsonEncode({
          "email": newEmail,
          "name": newUsername,
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3Mzk5MjQ5MTUsImV4cCI6MTc0NzcwMDkxNX0.scHyX3-nbGhi2ebaOekxXvztGs_8qbVMlzWsOS5Qs8E"
        },
      );

      print("🟢 [Repository] استجابة السيرفر: ${response.statusCode}");

      if (response.statusCode == 200) {

        print("✅ [Repository] تم تغيير البيانات بنجاح");
        return null;
      } else if (response.statusCode == 400) {
       final responseData = jsonDecode(response.body);
        String? errorMsg = (responseData["errors"] as List<dynamic>?)?.firstOrNull?["msg"];
        return errorMsg ?? "بيانات غير صحيحة، يرجى التأكد من المعلومات المدخلة.";
      } else if (response.statusCode == 401) {
        return "انتهت صلاحية الجلسة، يرجى تسجيل الدخول مجددًا.";
      } else {
        return "حدث خطأ غير معروف، حاول لاحقًا.";
      }
    } catch (e) {
      print("❗ [Repository] خطأ استثنائي: $e");
      return "حدث خطأ غير متوقع، حاول لاحقًا.";
    }
  }
}

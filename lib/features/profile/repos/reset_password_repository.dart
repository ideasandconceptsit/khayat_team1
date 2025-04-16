import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/services/end_point.dart';

class RestPasswordRepository {
  Future<String?> restPassword({required String email, required String newPassword}) async {
    try {
      print("🔵 إرسال طلب API لتغيير كلمة المرور...");
      
      final response = await http.put(
        Uri.parse('${EndPoint.baseUrl}${EndPoint.resetPassword}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'newPassword': newPassword}),
      );

      print("🟢 استجابة السيرفر: ${response.statusCode} - ${response.body}");

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("✅ تمت العملية بنجاح.");
        return null; // يعني نجاح العملية
      } else {
        String errorMessage = data['message'] ?? '❌ فشل تغيير كلمة المرور، حاول مرة أخرى';
        print("⚠ خطأ من السيرفر: $errorMessage");
        return errorMessage;
      }
    } catch (e) {
      print("❗ استثناء أثناء التنفيذ: ${e.toString()}");
      return '❌ حدث خطأ غير متوقع: ${e.toString()}';
    }
  }
}

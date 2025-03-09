import 'dart:convert';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:http/http.dart' as http;

class RestPasswordRepository {
  Future<String?> restPassword({required String email , required String newPassword}) async {
    try {
      print("إرسال طلب API لاستعادة كلمة المرور...");
      print("Request URL: ${EndPoint.baseUrl}${EndPoint.forgetPassword}");
      print("Request Body: { email: $email }");
      print("Request Body: { newPassword: $newPassword }");

      final response = await http.put(
        Uri.parse('${EndPoint.baseUrl}${EndPoint.resetPassword}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email , 'newPassword': newPassword}),
      );
   String requestBody = jsonEncode({'email': email , 'newPassword': newPassword});
   print("📤 البيانات المُرسلة: $requestBody");
      print("تم استلام استجابة من السيرفر: ${response.body}");

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200  ) {
        print("تمت العملية بنجاح.");
        return null;
      } else {
        String errorMessage =
            data['message'] ?? 'فشل تغيير كلمة المرور، حاول مرة أخرى';
        print("خطأ من السيرفر: $errorMessage");
        return errorMessage;
      }
    } catch (e) {
      print("استثناء حدث أثناء تنفيذ الطلب: ${e.toString()}");
      return 'حدث خطأ غير متوقع: ${e.toString()}';
    }
  }
}

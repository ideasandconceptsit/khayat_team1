import 'dart:convert';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:http/http.dart' as http;

class VerificationRepository {
  Future<String?> verificationRestCode({required String resetCode}) async {
    try {
      print(" إرسال طلب API للتحقق من كود إعادة تعيين كلمة المرور...");
      print("Request URL: ${EndPoint.baseUrl}${EndPoint.verifyResetCode}");
      print("Request Body: { resetCode: $resetCode }");
final response = await http.post(
  Uri.parse('${EndPoint.baseUrl}${EndPoint.verifyResetCode}'),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  body: jsonEncode({'resetCode': resetCode.toString()}),
);
   String requestBody = jsonEncode({'resetCode': resetCode});
   print("📤 البيانات المُرسلة: $requestBody");
      print("تم استلام استجابة من السيرفر: ${response.body}");

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'Success') {
        print("تمت العملية بنجاح.");
        return null;
      } else {
        String errorMessage =
            data['message'] ?? 'فشل في إرسال الكود، حاول مرة أخرى';
        print("خطأ من السيرفر: $errorMessage");
        return errorMessage;
      }
    } catch (e) {
      print("استثناء حدث أثناء تنفيذ الطلب: ${e.toString()}");
      return 'حدث خطأ غير متوقع: ${e.toString()}';
    }
  }
}

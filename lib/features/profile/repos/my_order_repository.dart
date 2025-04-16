import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/core/services/end_point.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';

class OrderRepository {
  final ApiService _apiService;

  OrderRepository(this._apiService);

  Future<List<OrderModels>?> getSpecificOrder({required String userId}) async {
    try {
      print("🔵 [OrderRepository] - بدء جلب الطلبات للمستخدم: $userId");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.getSpacificOrder + userId,
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3Mzc5MTQ1MjEsImV4cCI6MTc0NTY5MDUyMX0.YGmHvF8022J-Y4YVS02gpNZgP6T_kw78DgL4v6--xpU"
        },
      );

      print("📥 [OrderRepository] - البيانات المسترجعة: $response");

      if (response == null) {
        throw Exception("⚠️ [OrderRepository] - لم يتم استرجاع أي بيانات.");
      }

      if (response["data"] != null) {
        try {
          print("✅ [OrderRepository] - تم استرجاع البيانات بنجاح.");
          return [OrderModels.fromJson(response["data"])];
        } catch (e) {
          print("❌ [OrderRepository] - خطأ أثناء تحويل البيانات: $e");
        }
      } else {
        throw Exception("⚠️ [OrderRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [OrderRepository] - خطأ أثناء جلب الطلبات: $e");
      return null;
    }
    return null;
  }
}

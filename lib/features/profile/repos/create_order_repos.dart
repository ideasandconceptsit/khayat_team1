import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/create_order_model.dart';

class CreateOrderRepository {
  final ApiService _apiService;

  CreateOrderRepository(this._apiService);

  // إنشاء الطلب
  Future<CreateOrderModel?> createOrder(Map<String, dynamic> orderData) async {
    try {
      print("🔵 [OrderRepository] - بدء جلب الطلبات:");

      // استدعاء API لإنشاء الطلب
      final response = await _apiService.postRequest(
        EndPoint.baseUrl,
        EndPoint.createOrder, // افترض أنه يوجد Endpoint لهذا الغرض
        headers: { 
          "Content-Type": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M",
        },
        body: orderData,  // إرسال بيانات الطلب
      );

      // تحقق من الاستجابة
      if (response == null) {
        throw Exception("⚠️ [OrderRepository] - لم يتم استرجاع أي بيانات.");
      }

      if (response["data"] != null && response["data"] is Map) {
        print("✅ [OrderRepository] - تم استرجاع البيانات بنجاح.");
        return CreateOrderModel.fromJson(response["data"]);
      } else {
        throw Exception("⚠️ [OrderRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [OrderRepository] - خطأ أثناء جلب الطلبات: $e");
      return null;
    }
  }
}


import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';

class OrderRepository {
    final ApiService _apiService;

  OrderRepository(this._apiService);

  Future<List<OrderModels>?> getAllOrder() async {
  try {
    final response = await _apiService.getRequest(
      EndPoint.baseUrl,
      EndPoint.getAllOrder,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M "
      },
    );

    print("🔵 [OrderRepository] - البيانات المسترجعة من الـ API: $response");

    if (response is Map<String, dynamic> && response.containsKey("data")) {
      List<dynamic> rawOrders = response["data"];
      
      print("📋 [OrderRepository] - عدد الطلبات المسترجعة: ${rawOrders.length}");
      
      List<OrderModels> orders = rawOrders.map((order) {
        print("📝 [OrderRepository] - الطلب المسترجع: $order");
        return OrderModels.fromJson(order);
      }).toList();

      return orders;
    } else {
      throw Exception("⚠️ [OrderRepository] - البيانات غير صحيحة: $response");
    }
  } catch (e) {
    print("❌ [OrderRepository] - خطأ أثناء جلب الطلبات: $e");
    return null;
  }
}

}
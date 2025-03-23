import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/copun_model.dart';

class CopunRepository {
  final ApiService _apiService;

  CopunRepository(this._apiService);

  Future<List<CouponModel>?> getCopuns() async {
    try {
      print("🔵 [CopunRepository] - بدء جلب الكوبونات...");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.coupons,
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3NDA1NzI4MTcsImV4cCI6MTc0ODM0ODgxN30.qBwgO1xjYWbIXkdMvMCgF9wzvRw82InP17E4eNrWlsI"
        },
      );

      print("📥 [CopunRepository] - البيانات المسترجعة: $response");

      if (response == null) {
        throw Exception("⚠️ لم يتم استرجاع أي بيانات.");
      }

      if (response["data"] != null && response["data"] is List) {
        try {
          List<CouponModel> coupons = (response["data"] as List)
              .map((coupon) => CouponModel.fromJson(coupon))
              .toList();

          print("✅ [CopunRepository] - تم استرجاع ${coupons.length} كوبون.");
          return coupons;
        } catch (e) {
          print("❌ [CopunRepository] - خطأ أثناء تحويل البيانات: $e");
        }
      } else {
        throw Exception("⚠️ البيانات غير صحيحة أو ليست قائمة.");
      }
    } catch (e) {
      print("❌ [CopunRepository] - خطأ أثناء جلب الكوبونات: $e");
      return null;
    }
    return null;
  }
}

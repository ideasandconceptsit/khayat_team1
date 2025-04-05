import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/main2/model/accessories_model.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  Future<List<FabricModel>?> getAllFabric() async {
    try {
      print("🔵 [ProductRepository] - بدء جلب الطلبات :");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.fabric,
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M"
        },
      );

      print("📥 [ProductRepository] - البيانات المسترجعة: $response");

      if (response == null) {
        throw Exception("⚠️ [ProductRepository] - لم يتم استرجاع أي بيانات.");
      }

      if (response == null) {
        throw Exception("⚠️ [ProductRepository] - لم يتم استرجاع أي بيانات.");
      }

      if (response["data"] != null && response["data"] is List) {
        print("✅ [ProductRepository] - تم استرجاع البيانات بنجاح.");
        return (response["data"] as List)
            .map((item) => FabricModel.fromJson(item))
            .toList();
      } else {
        throw Exception("⚠️ [ProductRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [ProductRepository] - خطأ أثناء جلب الطلبات: $e");
      return null;
    }
  } 



   Future<List<ProductAccessories>?> getAllAccessories() async {
    try {
      print("🔵 [ProductRepository] - بدء جلب الأكسسوارات :");

      final response = await _apiService.getRequest(
        EndPoint.baseUrl,
        EndPoint.accessories,  
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3NDA1NzI4MTcsImV4cCI6MTc0ODM0ODgxN30.qBwgO1xjYWbIXkdMvMCgF9wzvRw82InP17E4eNrWlsI"
        },
      );

      print("📥 [ProductRepository] - البيانات المسترجعة: $response");

      if (response == null) {
        throw Exception("⚠️ [ProductRepository] - لم يتم استرجاع أي بيانات.");
      }

      if (response["data"] != null && response["data"] is List) {
        print("✅ [ProductRepository] - تم استرجاع البيانات بنجاح.");
        return (response["data"] as List)
            .map((item) => ProductAccessories.fromJson(item))  
            // استخدام موديل Product 
            .toList();
      } else {
        throw Exception("⚠️ [ProductRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [ProductRepository] - خطأ أثناء جلب الأكسسوارات: $e");
      return null;
    }
  }
}

import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';
import 'package:team1_khayat/features/main2/repos/product_repository.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository = ProductRepository(ApiService());

  var isLoading = false.obs;
  var fabricList = <FabricModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("🔵 [ProductController] - بدء `onInit` وجلب الطلبات...");
    fetchFabricProduct();
  }

  Future<void> fetchFabricProduct() async {
    try {
      isLoading(true);
      print("🟡 [ProductController] - جاري تحميل الطلبات...");

      final fetchedFabric = await _productRepository.getAllFabric();

      if (fetchedFabric != null && fetchedFabric.isNotEmpty) {
        fabricList.assignAll(fetchedFabric);
        print("✅ [ProductController] - تم تحميل ${fabricList.length} طلب.");
        SnackbarHelper.showSuccessSnackbar("تم تحميل المنتجات بنجاح.");
      } else {  
        print("⚠️ [ProductController] - لم يتم العثور على أي اقمشه.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي اقمشه.");
      }
    } catch (e) {
      print("❌ [ProductController] - خطأ أثناء تحميل اقمشه: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل المنتجات حاول مرة أخرى.");
    } finally {
      isLoading(false);
      print("🔵 [ProductController] - انتهى تحميل الطلبات.");
    }
  }
}

import 'package:get/get.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/repos/my_order_repository.dart';


class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository(ApiService());

  var isLoading = false.obs;
  var orders = <OrderModels>[].obs;

  @override
  void onInit() {
    super.onInit();
        print("🔵 [OrderController] - بدأ `onInit`، سيتم جلب بيانات المستخدم...");

    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      print("🟡 [OrderController] - جاري تحميل الطلبات...");

      final fetchedOrders = await _orderRepository.getAllOrder('67c972350ba950124063fa7f');

      if (fetchedOrders != null) {
        orders.assignAll(fetchedOrders);
        print("✅ [OrderController] - تم تحميل ${orders.length} طلب.");
      } else {
        showErrorSnackbar("لم يتم العثور على طلبات، حاول مرة أخرى لاحقًا.");
      }
    } catch (e) {
      print("❌ [OrderController] - خطأ أثناء جلب الطلبات: $e");
    } finally {
      isLoading(false);
    }
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      "خطأ",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 3),
    );
  }

 
}

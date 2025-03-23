import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/features/profile/repos/my_order_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository(ApiService());

  var isLoading = false.obs;
  var orders = <OrderModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("🔵 [OrderController] - بدء `onInit` وجلب الطلبات...");
    fetchSpecificOrders();
  }

  Future<void> fetchSpecificOrders() async {
    try {
      isLoading(true);
      print("🟡 [OrderController] - جاري تحميل الطلبات...");

      const userId = "67db5197ff81f66ffd2341ee";
      final fetchedOrders = await _orderRepository.getSpecificOrder(userId: userId);

      if (fetchedOrders != null && fetchedOrders.isNotEmpty) {
        orders.assignAll(fetchedOrders);
        print("✅ [OrderController] - تم تحميل ${orders.length} طلب.");
                print("✅ [OrderController] - عدد ليست الاوردر  ${orders[0].items.length} طلب.");

      } else {  
        print("⚠️ [OrderController] - لم يتم العثور على أي طلبات.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي طلبات.");
      }
    } catch (e) {
      print("❌ [OrderController] - خطأ أثناء تحميل الطلبات: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل الطلبات، حاول مرة أخرى.");
    } finally {
      isLoading(false);
      print("🔵 [OrderController] - انتهى تحميل الطلبات.");
    }
  }
}

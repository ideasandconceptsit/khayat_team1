import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/create_order_model.dart';
import 'package:team1_khayat/features/profile/repos/create_order_repos.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class CreateOrderController extends GetxController {
  final CreateOrderRepository _orderRepository;
  RxList<CreateOrderModel> ordersList = <CreateOrderModel>[].obs;
  RxBool isLoading = false.obs;

  CreateOrderController(this._orderRepository);

  // إنشاء الطلب
  Future<void> createOrder(Map<String, dynamic> orderData) async {
    try {
      isLoading(true);
      print("🟡 [OrderController] - جاري إنشاء الطلب...");

      // محاولة إنشاء الطلب
      final createOrder = await _orderRepository.createOrder(orderData);

      if (createOrder != null) {
        ordersList.add(createOrder);
        print("✅ [OrderController] - تم إنشاء الطلب بنجاح.");
        SnackbarHelper.showSuccessSnackbar("تم إنشاء الطلب بنجاح.");
      } else {
        print("⚠️ [OrderController] - لم يتم العثور على الطلب.");
        SnackbarHelper.showErrorSnackbar("لم يتم إنشاء الطلب.");
      }
    } catch (e) {
      // تسجيل الأخطاء بشكل مفصل
      print("❌ [OrderController] - خطأ أثناء إنشاء الطلب: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء إنشاء الطلب حاول مرة أخرى.");
    } finally {
      isLoading(false);
      print("🔵 [OrderController] - انتهى إنشاء الطلب.");
    }
  }
}

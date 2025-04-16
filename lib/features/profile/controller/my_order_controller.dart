import 'package:get/get.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/repos/my_order_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';


class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository(ApiService());

  var isLoading = false.obs;
  var orders = <OrderModels>[].obs;
  final RxString searchQuery = ''.obs;
  final RxList<OrderModels> filteredFavorites = <OrderModels>[].obs;
  var allFavorites = <OrderModels>[].obs;

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

      const userId = "67e40d7f3881030f70eff227";    
      final fetchedOrders = await _orderRepository.getSpecificOrder(userId: userId);

      if (fetchedOrders != null && fetchedOrders.isNotEmpty) {
        orders.assignAll(fetchedOrders);
        allFavorites.assignAll(fetchedOrders); 
        print("✅ [OrderController] - تم تحميل ${orders.length} طلب.");
        applyFilters(); 
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

  void searchOrder(String query) {
    searchQuery.value = query.trim(); 
    print("🔍 [OrderController] - بحث بـ: $query");
    applyFilters();
  }

  void clearSearch() {
    searchQuery.value = '';
    applyFilters();
  }

  void applyFilters() {
    if (searchQuery.isEmpty) {
      filteredFavorites.assignAll(allFavorites); 
    } else {
      filteredFavorites.assignAll(allFavorites.where((item) {
        bool matchesOrderNumber = item.orderNumber?.contains(searchQuery.value) ?? false;
        bool matchesTrackingNumber = item.trackingNumber?.contains(searchQuery.value) ?? false;

        print("🔵 [OrderController] - محاولة تطابق مع: ${item.orderNumber}, ${item.trackingNumber}");

        return matchesOrderNumber || matchesTrackingNumber;
      }).toList());

      if (filteredFavorites.isEmpty) {
        print("⚠️ [OrderController] - لا توجد نتائج للبحث.");
      }
    }
  }

  void performSearch(String query) {
    searchQuery.value = query;
    applyFilters();
  }
}


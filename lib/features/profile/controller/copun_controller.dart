import 'package:get/get.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/features/profile/model/copun_model.dart';
import 'package:team1_khayat/features/profile/repos/copun_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class CouponsController extends GetxController {
  final CopunRepository _copunRepository = CopunRepository(ApiService());

  var isLoading = false.obs;
  var coupons = <CouponModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("🔵 [CouponsController] - بدء `onInit` وجلب الكوبونات...");
    fetchAllCopuns();
  }

  Future<void> fetchAllCopuns() async {
    try {
      isLoading(true);
      print("🟡 [CouponsController] - جاري تحميل الكوبونات...");

      final fetchedCoupons = await _copunRepository.getCopuns();

      if (fetchedCoupons != null && fetchedCoupons.isNotEmpty) {
        coupons.assignAll(fetchedCoupons);
        print("✅ [CouponsController] - تم تحميل ${coupons.length} كوبون.");
      } else {
        print("⚠️ [CouponsController] - لم يتم العثور على أي كوبونات.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي كوبونات.");
      }
    } catch (e) {
      print("❌ [CouponsController] - خطأ أثناء تحميل الكوبونات: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل الكوبونات، حاول مرة أخرى.");
    } finally {
      isLoading(false);
      print("🔵 [CouponsController] - انتهى تحميل الكوبونات.");
    }
  }
}

import 'package:get/get.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import '../repos/favorite_repos.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  var favorites = <String>[].obs;

  void toggleFavorite(String fabricId) async {
    try {
      final success = await _repository.toggleFabricFavorite(fabricId);
      if (success) {
        if (favorites.contains(fabricId)) {
          favorites.remove(fabricId);
          SnackbarHelper.showErrorSnackbar("تمت الإزالة من المفضلة.");
        } else {
          favorites.add(fabricId);
          SnackbarHelper.showSuccessSnackbar("تمت الإضافة إلى المفضلة.");
        }
      } else {
        SnackbarHelper.showErrorSnackbar("فشل في تعديل المفضلة.");
      }
    } catch (e) {
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تعديل المفضلة.");
      print('❌ استثناء: $e');
    }
  }
}

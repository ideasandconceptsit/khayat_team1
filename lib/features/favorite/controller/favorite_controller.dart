import 'package:get/get.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import '../repos/favorite_repos.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository _repository;

  FavoriteController(this._repository);

  var favorites = <String>[].obs;
 
 //! toggle favorite status of fabric
  void toggleFabricFavorite(String fabricId) async {
    try {
      final success = await _repository.addFabricToFavorite(fabricId);
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

  
   //! toggle favorite status of Accessories


    void togglAccessoriesFavorite(String accessoryId) async {
    try {
      final success = await _repository.addAccessoriesToFavorite(accessoryId);
      if (success) {
        if (favorites.contains(accessoryId)) {
          favorites.remove(accessoryId);
          SnackbarHelper.showErrorSnackbar("تمت الإزالة من المفضلة.");
        } else {
          favorites.add(accessoryId);
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

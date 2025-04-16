import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/core/services/end_point.dart';
import 'package:team1_khayat/features/authintication/model/user.dart';
class LoginRepository {
  final ApiService _apiService;
  LoginRepository(this._apiService);
  bool isLoading=false;
  Future<UserModel?> getUserData( String email ,
   String password ) async {
    try {
      print("🔵 [LoginRepository] - بدء تسجيل الدخول :");
      var data ={
        "email": email,
        "password": password,
      };
      final response = await _apiService.post(
        EndPoint.login,data
      );
      print("📥 [LoginRepository] - البيانات المسترجعة: $response");
      if (response == null) {
        throw Exception("⚠️ [LoginRepository] - لم يتم استرجاع أي بيانات.");
      }
      if (response != null ) {
        print("✅ [LoginRepository] - تم استرجاع البيانات بنجاح.");
        return UserModel.fromJson(response);
        //   (response["data"] as List)
        //     .map((item) => UserModel.fromJson({
        //   "data": item,
        //   "token": response["token"], // لو التوكن جاي مع نفس الريسبونس
        // }))
         //   .toList();
      } else {
        throw Exception("⚠️ [LoginRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [LoginRepository] - خطأ أثناء جلب الطلبات: $e");
      return null;
    }
  }

}

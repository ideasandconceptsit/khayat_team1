import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/core/services/end_point.dart';
import 'package:team1_khayat/features/authintication/model/user.dart';

class SignUpRepository {
  final ApiService _apiService;
  SignUpRepository(this._apiService);
  bool isLoading=false;
  Future<int> addUserData( String email ,
      String password , String name) async {
    try {
      print("🔵 [LoginRepository] - بدء تسجيل الحساب :");
      var data ={
        "name":name,
        "email": email,
        "password": password,
        "passwordConfirm":password
      };
      final response = await _apiService.post(
          EndPoint.signup,data
      );
      print("📥 [SignUpRepository] - البيانات المسترجعة: $response");

      if (response == null) {
        throw Exception("⚠️ [SignUpRepository] - لم يتم استرجاع أي بيانات.");
      }
      if (response != null ) {
        print("✅ [SignUpRepository] - تم استرجاع البيانات بنجاح.");
        return 201;
        //   (response["data"] as List)
        //     .map((item) => UserModel.fromJson({
        //   "data": item,
        //   "token": response["token"], // لو التوكن جاي مع نفس الريسبونس
        // }))
        //   .toList();
      } else {
        throw Exception("⚠️ [SignUpRepository] - البيانات غير صحيحة.");
      }
    } catch (e) {
      print("❌ [SignUpRepository] - خطأ أثناء جلب البيانات: $e");
      return 0;
    }
  }

}

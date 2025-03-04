import 'dart:developer';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/core/service/end_point.dart';
import 'package:team1_khayat/features/profile/model/get_specific_user_model.dart';
class ProfileRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

 Future<UserModel?> fetchUserData(String userId) async {
  try {
    log("🔵 [ProfileRepository] - Fetching user data for ID: $userId");
    final response = await _apiService.getRequest(
      EndPoint.baseUrl,
      "${EndPoint.getSpecificUser}$userId",
      headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3Mzc5MTQ1MjEsImV4cCI6MTc0NTY5MDUyMX0.YGmHvF8022J-Y4YVS02gpNZgP6T_kw78DgL4v6--xpU"},
    );

    if (response != null && response is Map<String, dynamic>) {
      final data = response["data"]; 
      if (data != null) {
        return UserModel.fromJson(data);
      } else {
        log("❌ [ProfileRepository] - User data is null");
        return null;
      }
    } else {
      log("❌ [ProfileRepository] - Invalid response format");
      return null;
    }
  } catch (e) {
    log("❌ [ProfileRepository] - Error fetching user: $e");
    return null;
  }
}
 


}
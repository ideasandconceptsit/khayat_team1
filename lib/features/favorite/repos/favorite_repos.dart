import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/services/end_point.dart';

class FavoriteRepository {
  //! Add fabric to favorite
  Future<bool> addFabricToFavorite(String fabricId) async {
    final url = Uri.parse('${EndPoint.baseUrl}${EndPoint.addFabricFavorite}');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M',
    };

    final body = jsonEncode({
      'fabricId': fabricId,
    });

    final response = await http.post(url, headers: headers, body: body);

    print('✅ fabric favorite response: ${response.body}');
    print('🔢 status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['status'] == 'success';
    } else {
      return false;
    }
  }

  //! Add accessories to favorite
  Future<bool> addAccessoriesToFavorite(String accessoryId) async {
    final url = Uri.parse('${EndPoint.baseUrl}${EndPoint.addaccessoriesFavorite}');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M',
    };

    final body = jsonEncode({
      'accessoryId': accessoryId,
    });

    final response = await http.post(url, headers: headers, body: body);

    print('✅ accessory favorite response: ${response.body}');
    print('🔢 status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['status'] == 'success';
    } else {
      return false;
    }
  }
}

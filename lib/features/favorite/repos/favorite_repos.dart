import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/service/end_point.dart';


class FavoriteRepository {

  
//! toggle favorite status of fabric
  Future<bool> addFabricToFavorite(String fabricId) async {
    final url = Uri.parse('${EndPoint.baseUrl}${EndPoint.addFabricFavorite}');
    final headers = {
      'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3NDA1NzI4MTcsImV4cCI6MTc0ODM0ODgxN30.qBwgO1xjYWbIXkdMvMCgF9wzvRw82InP17E4eNrWlsI"
    };
    final body = {"fabricId": fabricId};

    final response = await http.post(url, headers: headers, body: body);
    print('📥 Response Status Code: ${response.statusCode}');
    print('📥 Response Body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['status'] == 'success';
    } else {
      return false;
    }
  }  

//! toggle favorite status of Accessories
  Future<bool> addAccessoriesToFavorite(String accessoryId) async {
    final url = Uri.parse('${EndPoint.baseUrl}${EndPoint.addaccessoriesFavorite}');
    final headers = {
      'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg2Nzg3MmJmZTMyNWE0ZGY0NmYiLCJpYXQiOjE3NDA1NzI4MTcsImV4cCI6MTc0ODM0ODgxN30.qBwgO1xjYWbIXkdMvMCgF9wzvRw82InP17E4eNrWlsI"
    };
    final body = {"accessoryId": accessoryId};

    final response = await http.post(url, headers: headers, body: body);
    print('📥 Response Status Code: ${response.statusCode}');
    print('📥 Response Body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['status'] == 'success';
    } else {
      return false;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  static const String baseUrl = 'https://khayat-backend.onrender.com';
  final GetStorage _storage = GetStorage();

  // Get token from storage
  String? get _token => _storage.read<String>('token');

  // Headers with authentication
  Map<String, String> get headers {
    return {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Nzk2Nzg5MDg3MmJmZTMyNWE0ZGY0NzYiLCJpYXQiOjE3MzgwODM5ODUsImV4cCI6MTc0NTg1OTk4NX0.rDyLTL4G9Kjd2xxUiTFW0ZyzJLdpt61GNnCskpYa09M",
    };
  }

  // GET request
  Future<dynamic> get(String endpoint) async {
    try {
      final request = http.Request('GET', Uri.parse('$baseUrl/api/$endpoint'));
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  // POST request
  Future<dynamic> post(String endpoint, dynamic data) async {
    try {
      final request = http.Request('POST', Uri.parse('$baseUrl/api/$endpoint'));
      request.headers.addAll(headers);
      request.body = json.encode(data);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint, dynamic data) async {
    try {
      final request = http.Request('PUT', Uri.parse('$baseUrl/api/$endpoint'));
      request.headers.addAll(headers);
      request.body = json.encode(data);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    try {
      final request =
          http.Request('DELETE', Uri.parse('$baseUrl/api/$endpoint'));
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  // Handle API response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      // Unauthorized - token expired or invalid
      _storage.remove('token');
      Get.offAllNamed('/login'); // Redirect to login
      throw Exception('Unauthorized: ${response.body}');
    } else {
      throw Exception('API Error: ${response.statusCode} - ${response.body}');
    }
  }

  // Handle errors
  void _handleError(dynamic error) {
    if (error is Exception &&
        error.toString().contains("No authentication token found")) {
      // Handle the specific "No authentication token found" error
      Get.offAllNamed('/login'); // Redirect to login
    } else {
      Get.snackbar(
        'error'.tr,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    throw error;
  }
}

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
     // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2Q0YmViNzljZWZkZTI4YWY2MjlkZDYiLCJpYXQiOjE3NDE5OTU3MDYsImV4cCI6MTc0OTc3MTcwNn0.MfH0NI5oq5T-PS8eReIFmrKMo16LjNJhU4haiIFTrPE"
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
      final request = http.Request('POST', Uri.parse('$baseUrl$endpoint'));
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
      // Check if response body is empty or whitespace only
      if (response.body.isEmpty || response.body.trim().isEmpty) {
        return {}; // Return empty map for empty responses
      }

      try {
        return json.decode(response.body);
      } catch (e) {
        print('JSON parsing error: $e');
        // If JSON parsing fails, return empty map instead of throwing an error
        return {};
      }
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
  Future<dynamic> getRequest(String baseUrl, String endpoint, {Map<String, String>? headers}) async {
    try {
      print("🔵 [ApiService] - Sending GET request to: $baseUrl$endpoint");
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {},
      );
      print("🟡 [ApiService] - Response status: ${response.statusCode}");
      print("📥 [ApiService] - Response body: ${response.body}");

      return _handleResponse(response);
    } catch (e) {
      print("❌ [ApiService] - Error in GET request: $e");
      return _handleError(e);
    }
  }

  Future<dynamic> postRequest(String baseUrl, String endpoint, {Map<String, String>? headers, required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> putRequest(String baseUrl, String endpoint, {Map<String, String>? headers, required Map<String, dynamic> body}) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> deleteRequest(String baseUrl, String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {},
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // dynamic _handleResponse(http.Response response) {
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception("فشل الطلب، رمز الحالة: ${response.statusCode}");
  //   }
  // }

  // dynamic _handleError(dynamic error) {
  //   return {'error': 'Failed to connect to server: $error'};
  // }
}
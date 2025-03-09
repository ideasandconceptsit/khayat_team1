import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
 Future<dynamic> getRequest(String baseUrl, String endpoint, {required Map<String, String> headers}) async {
  try {
    print("🔵 [ApiService] - Sending GET request to: $baseUrl$endpoint");
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    print("🟡 [ApiService] - Response status: ${response.statusCode}");
    print("📥 [ApiService] - Response body: ${response.body}");
    
    return _handleResponse(response);  
  } catch (e) {
    print("❌ [ApiService] - Error in GET request: $e");
    return _handleError(e);   
  }
}


  Future<dynamic> postRequest(String baseUrl, String endpoint, { Map<String, String>? headers, required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> putRequest(String baseUrl, String endpoint, {required Map<String, String> headers, required Map<String, dynamic> body}) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> deleteRequest(String baseUrl, String endpoint, {required Map<String, String> headers}) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

 dynamic _handleResponse(http.Response response) {
  if (response.statusCode == 200) {
    return jsonDecode(response.body); 
  } else {
    throw Exception("فشل الطلب، رمز الحالة: ${response.statusCode}");
  }
}

  dynamic _handleError(dynamic error) {
    return {'error': 'Failed to connect to server: $error'};
  }
}
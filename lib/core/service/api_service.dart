
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:team1_khayat/core/service/exception.dart';

class ApiService {
  Future<dynamic> get({required String url, String? token}) async {
    try {
      final headers = _buildHeaders(token);
      final response = await http.get(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Error in GET request: $e');
    }
  } 
  

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    try {
      final headers = _buildHeaders(token);
      final response = await http.post(Uri.parse(url), body: body, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Error in POST request: $e');
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    try {
      final headers = _buildHeaders(token);
      final response = await http.put(Uri.parse(url), body: body, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Error in PUT request: $e');
    }
  }

  Map<String, String> _buildHeaders(String? token) {
    final headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(jsonDecode(response.body)['message'] ?? 'Bad Request');
      case 401:
        throw UnauthorizedException('Unauthorized access');
      case 402:
        throw PaymentRequiredException('Payment required');
      case 500:
        throw ServerException('Internal Server Error');
      default:
        throw ApiException('Unexpected error: ${response.statusCode}');
    }
  }
}

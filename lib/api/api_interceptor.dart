import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resturant_menu/api/api_exception.dart';

class ApiInterceptor {
  final String baseUrl;

  ApiInterceptor(this.baseUrl);

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$path');

    try {
      final response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw _handleError(response.statusCode);
      }
    } catch (e) {
      throw FetchDataException("Error during communication: $e");
    }
  }

  ApiException _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return BadRequestException("Invalid request");
      case 401:
        return UnauthorisedException("Unauthorised");
      case 500:
        return ServerException("Internal Server Error");
      default:
        return ApiException("Unexpected error occurred");
    }
  }
}

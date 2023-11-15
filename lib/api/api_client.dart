import 'package:http/http.dart' as http;
import 'package:resturant_menu/api/api_exception.dart';
import 'package:resturant_menu/models/resturant_model.dart';

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<Resturant> postData(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/getAllDigitalMenu.php');

    try {
      final response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        return resturantFromJson(response.body);
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

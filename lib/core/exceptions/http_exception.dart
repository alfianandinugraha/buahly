import 'package:http/http.dart';

class HttpResponseException implements Exception {
  Response response;

  HttpResponseException(this.response);

  static Map<int, String> messages = {
    404: "[404] Data not found",
  };

  @override
  String toString() {
    String message = HttpResponseException.messages[response.statusCode] ?? "Failed to get data";
    return message;
  }
}

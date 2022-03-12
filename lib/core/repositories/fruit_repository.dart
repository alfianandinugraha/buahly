import 'package:http/http.dart' as http;

class FruitRepository {
  final String baseUrl = "https://api.allorigins.win/raw?url=https://www.fruityvice.com/api";

  Future<http.Response> getAll() async {
    final uri = Uri.parse("$baseUrl/fruit/all");

    var client = http.Client();
    var response = await client.get(
      uri,
      headers: {
        "X-Requested-With": "X-Requested-With"
      }
    );

    return response;
  }

  Future<http.Response> getById(int fruitId) async {
    final uri = Uri.parse("$baseUrl/fruit/$fruitId");

    var client = http.Client();
    var response = await client.get(
      uri,
      headers: {
        "X-Requested-With": "X-Requested-With"
      }
    );

    return response;
  }
}

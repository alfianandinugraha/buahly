import 'package:http/http.dart' as http;

class FruitRepository {
  final String baseUrl = "https://cors-anywhere.herokuapp.com/https://www.fruityvice.com/api";

  Future<http.Response> getAll() async {
    final uri = Uri.parse("$baseUrl/fruit/all");

    var client = http.Client();
    var response = await client.get(uri);

    return response;
  }

  Future<http.Response> getById(String fruitId) async {
    final uri = Uri.parse("$baseUrl/fruit/$fruitId");

    var client = http.Client();
    var response = await client.get(uri);

    return response;
  }
}

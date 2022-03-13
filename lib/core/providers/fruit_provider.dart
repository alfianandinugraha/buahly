import 'dart:convert';

import 'package:buahly/core/exceptions/http_exception.dart';
import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/repositories/fruit_repository.dart';

class FruitProvider {
  var repository = FruitRepository();

  Future<List<Fruit>> getAll() async {
    var response = await repository.getAll();
    if (response.statusCode >= 400) throw HttpResponseException(response);

    var body = json.decode(response.body) as List;
    var fruits = List<Fruit>.from(body.map((e) => Fruit.fromMap(e)));

    return fruits;
  }

  Future<Fruit> getById(int fruitId) async {
    var response = await repository.getById(fruitId);
    if (response.statusCode >= 400) throw HttpResponseException(response);

    var fruit = Fruit.fromJson(response.body);
    return fruit;
  }
}

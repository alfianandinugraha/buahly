import 'package:buahly/core/models/fruit.dart';

abstract class DetailFruitEvent {}

class FetchDetailFruit extends DetailFruitEvent {
  final int id;

  FetchDetailFruit({required this.id});
}

class CacheDetailFruit extends DetailFruitEvent {
  final Fruit fruit;

  CacheDetailFruit(this.fruit);
}

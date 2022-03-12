import 'package:buahly/core/models/fruit.dart';

abstract class DetailFruitState {}

class DetailFruitEmpty extends DetailFruitState {}

class DetailFruitLoaded extends DetailFruitState {
  final Fruit fruit;

  DetailFruitLoaded({required this.fruit});
}

class DetailFruitError extends DetailFruitState {}

class DetailFruitFetched extends DetailFruitState {}
